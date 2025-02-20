import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class CounterBadge extends ConsumerWidget {
  const CounterBadge({
    super.key,
    required this.child,
    required this.label,
    required this.isShow,
  });

  final Widget child;
  final String label;
  final bool isShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 10,
          right: 6,
          child: IgnorePointer(
            // ignoring 을 추가 하면 자식 위젯은 더이상 클릭 이벤트를 받지 못한다
            ignoring: true,
            child: CircleAvatar(
              backgroundColor: ref.color.secondary,
              radius: isShow ? 10 : 0,
              child: Text(
                label,
                style: ref.typo.body2.copyWith(
                  color: ref.color.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
