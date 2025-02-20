import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HideKeyboard extends ConsumerWidget {
  const HideKeyboard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // 💡 빈 공간도 인식
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: child,
    );
  }
}
