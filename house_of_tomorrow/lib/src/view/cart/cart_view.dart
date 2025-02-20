import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_bottom_sheet.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_checkout_dialog.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_delete_dialog.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_empty.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_item_tile.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 장바구니 아이템 목록 (불변 리스트)
    final cartItemList = ref.watch(cartServiceProvider);

    // 상태 변경 메서드 사용 (update, delete 등)
    final cartService = ref.read(cartServiceProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.cart),
        leading: const PopButton(),
        titleSpacing: 0,
        actions: [
          Button(
            onPressed: () {
              showDialog(
                context: context,
                builder: (constext) => CartDeleteDialog(
                  onDeletePressed: () {
                    cartService.delete(cartService.selectedCartItemList);
                  },
                ),
              );
            },
            text: S.current.delete,
            type: ButtonType.flat,
            color: ref.color.secondary,
            isInactive: cartService.selectedCartItemList.isEmpty,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItemList.isEmpty
                ? const CartEmpty()
                : ListView.builder(
                    itemCount: cartItemList.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItemList[index];
                      return CartItemTile(
                        cartItem: cartItem,
                        onPressed: () {
                          cartService.update(
                            index,
                            cartItem.copyWith(
                              isSelected: !cartItem.isSelected,
                            ),
                          );
                        },
                        onCountChanged: (count) {
                          cartService.update(
                            index,
                            cartItem.copyWith(count: count),
                          );
                        },
                      );
                    },
                  ),
          ),

          /// 하단에 나타나는 CartBottomSheet
          CartBottomSheet(
            totalPrice: cartService.selectedCartItemList.isEmpty
                ? '0'
                : IntlHelper.currency(
                    symbol: cartService
                        .selectedCartItemList.first.product.priceUnit,
                    number: cartService.selectedCartItemList.fold(0,
                        (prev, curr) => prev + curr.count * curr.product.price),
                  ),
            selectedCartItemList: cartService.selectedCartItemList,
            onCheckoutPressed: () {
              showDialog(
                context: context,
                builder: (context) => CartCheckoutDialog(
                  onCheckOutPressed: () {
                    cartService.delete(cartItemList);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
