import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/model/product.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/view/product/widget/product_color_preview.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductView> createState() => _ProductViewState();

}

class _ProductViewState extends State<ProductView>{

  @override
  Widget build(BuildContext context) {

    /// 선택한 수량
    int count = 1;

    /// 선택한 색상
    int colorIndext = 0;

    /// 수량 업데이트 이벤트 함수
    void onCountChanged(int newCount) {
      setState(() {
        count = newCount;
      });
    }

    /// 색상 업데이트 이벤트 함수
    void onColorChanged(int newColorIndex) {
      setState(() {
        colorIndext = newColorIndex;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.product),
        leading: const PopButton(),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          /// ProductColorPreview
          ProductColorPreview(
            colorIndex: colorIndext,
            product: widget.product,
          ),
        ],
      ),
    );
  }
}