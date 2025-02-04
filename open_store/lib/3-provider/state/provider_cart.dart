import 'package:flutter/material.dart';
import 'package:open_store/common/product.dart';

class ProviderCart with ChangeNotifier {
  /// 카트에 담긴 상품 목록
  List<Product> cartProductList = [];

  /// 상품 클릭
  void onProductPressed(Product product) {
    if (cartProductList.contains(product)) {
      // cartProductList.remove(product);
      cartProductList = cartProductList.where((cartProduct) {
        return cartProduct != product;
      }).toList();
    } else {
      // cartProductList.add(product);
      cartProductList = [...cartProductList, product];
    }
    notifyListeners();
  }
}
