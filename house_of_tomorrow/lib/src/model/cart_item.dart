import 'package:house_of_tomorrow/src/model/product.dart';

class CartItem {
  final Product product;

  final int colorIndex;

  final int count;

  final bool isSelected;

  const CartItem({
    required this.product,
    required this.colorIndex,
    required this.count,
    required this.isSelected,
  });

  CartItem copyWith({
    Product? product,
    int? colorIndex,
    int? count,
    bool? isSelected,
  }) {
    return CartItem(
      product: product ?? this.product,
      colorIndex: colorIndex ?? this.colorIndex,
      count: count ?? this.count,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
