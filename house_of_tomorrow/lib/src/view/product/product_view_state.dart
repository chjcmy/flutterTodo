import 'package:house_of_tomorrow/src/view/base_view_state.dart';

class ProductViewState extends BaseViewState {
  const ProductViewState({
    required this.isBusy,
    required this.count,
    required this.colorIndex,
  });

  @override
  final bool isBusy;

  final int count;

  final int colorIndex;

  ProductViewState copyWith({
    bool? isBusy,
    int? count,
    int? colorIndex,
  }) => ProductViewState(
      colorIndex: colorIndex ?? this.colorIndex,
      count: count ?? this.count,
      isBusy: isBusy ?? this.isBusy, 
      );
}
