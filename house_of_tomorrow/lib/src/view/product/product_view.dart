import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_bottom_sheet.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_color_preview.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_desc.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/color_picker.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  ConsumerState<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  /// 선택한 수량
  int count = 1;

  /// 선택한 색상
  int colorIndex = 0;

  /// 수량 업데이트 이벤트 함수
  void onCountChanged(int newCount) {
    setState(() {
      count = newCount;
    });
  }

  /// 색상 업데이트 이벤트 함수
  void onColorIndexChanged(int newColorIndex) {
    setState(() {
      colorIndex = newColorIndex;
    });
  }

  // 카트에 상품 추가
  void onAddToCartPressed() {
    final CartItem newCartItem = CartItem(
      colorIndex: colorIndex,
      count: count,
      isSelected: true,
      product: widget.product,
    );
    ref.read(cartServiceProvider.notifier).add(newCartItem);
    Toast.show(context, S.current.productAdded(widget.product.name));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.product),
          leading: const PopButton(),
          titleSpacing: 0,
          actions: [
            const CartButton(),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              // 스크린 공간을 초과하는 경우 내부 내용을 스크롤할 수 있도록 하는 위젯입니다.
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Wrap(
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: [
                    /// ProductColorPreview
                    ProductColorPreview(
                      colorIndex: colorIndex,
                      product: widget.product,
                    ),

                    /// ColorPicker
                    ColorPicker(
                      colorIndex: colorIndex,
                      colorList: widget.product.productColorList
                          .map((e) => e.color)
                          .toList(),
                      onColorSelected: onColorIndexChanged,
                    ),

                    ProductDesc(product: widget.product)
                  ],
                ),
              ),
            ),

            /// ProductBottomSheet
            ProductBottomSheet(
              count: count,
              product: widget.product,
              onCountChanged: onCountChanged,
              onAddToCartPressed: onAddToCartPressed,
            ),
          ],
        ),
      );
}
