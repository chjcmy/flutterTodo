import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view.dart';
import 'package:house_of_tomorrow/src/view/product/product_view_model.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_bottom_sheet.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_color_preview.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_desc.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_layout.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/color_picker.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) => BaseView(
      viewModelProvider: productViewModelProvider,
      builder: (ref, viewModel, state) => Scaffold(
            appBar: AppBar(
              title: Text(S.current.product),
              leading: const PopButton(),
              titleSpacing: 0,
              actions: const [
                CartButton(),
              ],
            ),
            body: ProductLayout(
              productInfo: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Wrap(
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: [
                    /// ProductColorPreview
                    ProductColorPreview(
                      colorIndex: state.colorIndex,
                      product: product,
                    ),

                    /// ColorPicker
                    ColorPicker(
                      colorIndex: state.colorIndex,
                      colorList: product.productColorList
                          .map((e) => e.color)
                          .toList(),
                      onColorSelected: viewModel.onColorIndexChanged,
                    ),

                    ProductDesc(product: product)
                  ],
                ),
              ),

              /// ProductBottomSheet
              productBottomSheet: ProductBottomSheet(
                count: state.count,
                product: product,
                onCountChanged: viewModel.onCountChanged,
                onAddToCartPressed: () => viewModel.onAddToCartPressed(product),
              ),
            ),
          ));
}
