import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';

class ProductLayout extends ConsumerWidget {
  const ProductLayout({
    super.key,
    required this.productInfo,
    required this.productBottomSheet,
  });

  final Widget productInfo;
  final Widget productBottomSheet;

  @override
  Widget build(BuildContext context, WidgetRef ref) => context.layout(
      Column(
        children: [
          Expanded(child: productInfo),
          productBottomSheet,
        ],
      ),
      desktop: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: productInfo,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: productBottomSheet,
              ),
            ),
          ],
        ),
      ));
}
