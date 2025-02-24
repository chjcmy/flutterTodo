import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/base_dialog.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartCheckoutDialog extends ConsumerWidget {
  const CartCheckoutDialog({
    super.key,
    required this.onCheckoutPressed,
  });

  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) => BaseDialog(
        title: S.current.checkout,
        content: Text(
          S.current.checkoutDialogDesc,
          style: ref.typo.headline6,
        ),
        actions: [
          Button(
            text: S.current.checkout,
            width: double.infinity,
            color: ref.color.onSecondary,
            backgroundColor: ref.color.secondary,
            onPressed: () {
              Navigator.pop(context);
              onCheckoutPressed();
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Button(
            text: S.current.cancel,
            width: double.infinity,
            color: ref.color.text,
            borderColor: ref.color.hint,
            type: ButtonType.outline,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
}
