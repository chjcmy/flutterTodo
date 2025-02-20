import 'dart:convert';
import 'dart:developer'; // ✅ log 사용 추가

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_card_grid.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_empty.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/hide_keyboard.dart';
import 'package:house_of_tomorrow/theme/component/input_field.dart';
import 'package:house_of_tomorrow/util/helper/network_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ShoppingView extends ConsumerStatefulWidget {
  const ShoppingView({super.key});

  @override
  ConsumerState<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends ConsumerState<ShoppingView> {
  final TextEditingController _searchController = TextEditingController();

  String get keyword => _searchController.text.trim();

  List productList = [];

  /// ✅ 검색 실행 및 로그 출력
  Future<void> searchProductList() async {
    try {
      final dio = ref.read(dioProvider); // ✅ `dioProvider`에서 Dio 인스턴스 가져오기
      final res = await dio.get(
        'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json',
      );

      setState(() {
        productList = jsonDecode(res.data).map<Product>((json) {
          return Product.fromJson(json);
        }).where((products) {
          if (keyword.isEmpty) return true;

          return "${products.name}${products.brand}}"
              .toLowerCase()
              .contains(keyword.toLowerCase());
        }).toList(); // ✅ Product 리스트로 업데이트
      });

      log('Fetched Products: $productList'); // ✅ 변환된 데이터 로그 출력
    } catch (e, s) {
      log('Failed to searchProductList', error: e, stackTrace: s);
    }
  }

  @override
  void initState() {
    super.initState();
    searchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.shopping),
          actions: [
            /// 설정 버튼
            Button(
              icon: 'option',
              type: ButtonType.flat,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const SettingBottomSheet();
                  },
                );
              },
            ),

            // 카트 버튼
            const CartButton(),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  /// 검색 입력 필드
                  Expanded(
                    child: InputField(
                      controller: _searchController,
                      onClear: searchProductList,
                      hint: S.current.searchProduct,
                    ),
                  ),
                  const SizedBox(width: 16),

                  /// 검색 버튼 (검색 후 결과를 `log`에 출력)
                  Button(
                    icon: 'search',
                    onPressed: searchProductList,
                  ),
                ],
              ),
            ),

            /// ProductCardGrid로 변경
            Expanded(
              child: productList.isEmpty
                  ? const ProductEmpty()
                  : ProductCardGrid(productList),
            ),
          ],
        ),
      ),
    );
  }
}
