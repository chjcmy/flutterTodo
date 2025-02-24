import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_card.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';

class ProductCardGrid extends ConsumerWidget {
  const ProductCardGrid(
    this.productList, {
    super.key,
  });

  final List productList;

  @override
  Widget build(BuildContext context, WidgetRef ref) => MasonryGridView.count(
        crossAxisCount: context.layout(2, tablet: 3, desktop: 4),
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ProductCard(product: product);
        });
}
