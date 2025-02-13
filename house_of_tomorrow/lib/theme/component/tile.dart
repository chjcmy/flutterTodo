import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class Tile extends ConsumerWidget {
  const Tile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String icon;
  final String title;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      // HitTestBehavior.translucent: 투명한 영역도 클릭 가능하게 함
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            /// Start Icon
            AssetIcon(
              icon,
            ),
            const SizedBox(width: 8),

            /// Title
            Expanded(
              child: Text(
                title,
                style: ref.typo.headline5,
              ),
            ),

            /// Subtitle
            Text(
              subtitle,
              style: ref.typo.subtitle1.copyWith(
                color: ref.color.primary,
              ),
            ),
            const SizedBox(width: 8),

            /// End Icon
            const AssetIcon('chevron-right'),
          ],
        ),
      ),
    );
  }
}
