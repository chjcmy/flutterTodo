import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/counter_button.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductBottomSheet extends ConsumerWidget {
  const ProductBottomSheet({
    // 전달받은 key를 부모 클래스(StatelessWidget)에 전달하여 위젯 고유 식별에 사용합니다.
    super.key,
    required this.count,
    required this.product,
    required this.onCountChanged,
    required this.onAddToCartPressed,
  });

  final int count;
  final Product product;
  final void Function(int count) onCountChanged;
  final void Function() onAddToCartPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseBottomSheet(
      padding: EdgeInsets.only(
        top: 32,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          Row(
            children: [
              Text(
                S.current.quantity,
                style: ref.typo.headline3,
              ),
              const Spacer(),
              CounterButton(count: count, onChanged: onCountChanged),
            ],
          ),
          Row(
            children: [
              Text(
                S.current.totalPrice,
                style: ref.typo.headline3,
              ),

              Spacer(), // 남은 공간을 차지하여 다음 위젯을 오른쪽에 배치합니다.

              Text(
                IntlHelper.currency(
                    symbol: product.priceUnit, number: product.price * count),
                style: ref.typo.headline3.copyWith(
                  color: ref.color.primary,
                ),
              )
            ],
          ),
          Button(
            width: double.infinity,
            size: ButtonSize.large,
            text: S.current.addToCart,
            onPressed: onAddToCartPressed,
          ),
        ],
      ),
    );
  }
}
