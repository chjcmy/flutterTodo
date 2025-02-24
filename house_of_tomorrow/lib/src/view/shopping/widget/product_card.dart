import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/src/view/product/product_view.dart';
import 'package:house_of_tomorrow/theme/component/rating.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) => GestureDetector(
        // GestureDetector는 터치 이벤트(탭, 더블탭, 길게 누름 등)를 감지하여 해당 제스처에 대한 동작(콜백)을 처리할 수 있는 Flutter 위젯
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductView(product: product),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ref.color.surface,
            boxShadow: ref.deco.shadow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.productColorList.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.productColorList.first.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

              /// Name
              Text(
                product.name.toString(),
                style: ref.typo.headline4.copyWith(
                  fontWeight: ref.typo.semiBold,
                ),
              ),
              const SizedBox(height: 4),

              const SizedBox(height: 4),
              Text(
                product.brand.toString(),
                style: ref.typo.body2.copyWith(
                  color: ref.color.subtext,
                  fontWeight: ref.typo.light,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      IntlHelper.currency(
                        number: product.price,
                        symbol: product.priceUnit,
                      ),
                      style: ref.typo.subtitle2,
                    ),
                  ),
                  Rating(rating: product.rating),
                ],
              )
            ],
          ),
        ),
      );
}
