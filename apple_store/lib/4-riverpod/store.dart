import 'package:apple_store/common/product.dart';
import 'package:apple_store/common/product_tile.dart';
import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
    required this.cartProductList,
    required this.onPressed,
  });

  final List<Product> cartProductList;

  final void Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: cartProductList.contains(product),
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}
