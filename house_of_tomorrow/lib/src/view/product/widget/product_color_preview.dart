import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class ProductColorPreview extends ConsumerWidget {
  const ProductColorPreview({
    super.key,
    required this.colorIndex,
    required this.product,
  });

  final int colorIndex;
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: ref.color.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: ref.deco.shadow,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // AspectRatio: 지정한 비율에 따라 위젯의 가로와 세로 크기를 자동으로 조정하는 위젯
        AspectRatio(
          aspectRatio: 1 / 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CachedNetworkImage(
              imageUrl: product.productColorList[colorIndex].imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(product.name.toString(),
            style: ref.typo.headline1.copyWith(
              fontWeight: ref.typo.semiBold,
            )),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              product.brand.toString(),
              style: ref.typo.subtitle1.copyWith(
                fontWeight: ref.typo.light,
                color: ref.color.subtext,
              ),
            ),
            const Spacer(),
            Text(
              IntlHelper.currency(
                  symbol: product.priceUnit, number: product.price),
              style: ref.typo.headline6.copyWith(color: ref.color.primary),
            )
          ],
        )
      ]),
    );
  }
}
