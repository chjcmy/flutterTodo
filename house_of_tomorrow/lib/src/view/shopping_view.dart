import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ShoppingView extends ConsumerWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                  });
            },
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            ref.themeService.toggleTheme(); // 테마 전환 호출
          },
          child: Text("Toggle Theme", style: ref.typo.headline6),
        ),
      ),
    );
  }
}
