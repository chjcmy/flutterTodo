import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/language_serivce.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/src/view/shopping_view.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: ref.watch(langServiceProvider),
      theme: ref.themeService.themeData,
      themeMode: ref.watch(themeServiceProvider).brightness == Brightness.light
          ? ThemeMode.light
          : ThemeMode.dark,
      home: ShoppingView(), // ✅ 기본 화면을 ShoppingView로 변경
    );
  }
}
