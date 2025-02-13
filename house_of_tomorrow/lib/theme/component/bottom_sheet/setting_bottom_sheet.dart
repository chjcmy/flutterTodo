import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/language_serivce.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/tile.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class SettingBottomSheet extends ConsumerWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLightTheme = ref.theme.brightness == Brightness.light;
    return BaseBottomSheet(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tile(
          icon: isLightTheme ? 'sunny' : 'moon',
          title: S.current.theme,
          subtitle: isLightTheme ? S.current.light : S.current.dark,
          onPressed: ref.read(themeServiceProvider.notifier).toggleTheme,
        ),
        Tile(
          icon: 'language',
          title: S.current.language,
          subtitle: ref.watch(langServiceProvider).languageCode,
          onPressed: ref.read(langServiceProvider.notifier).toggleLang,
        ),
      ],
    ));
  }
}
