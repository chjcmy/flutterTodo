import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';

class InputField extends ConsumerStatefulWidget {
  const InputField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final String? hint;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;

  @override
  ConsumerState<InputField> createState() => _InputFiledState();
}

class _InputFiledState extends ConsumerState<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          /// 테두리 삭제
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),

          /// 테두리 모서리 둥글게
          borderRadius: BorderRadius.circular(12),
        ),

        /// 배경 색상
        filled: true,
        fillColor: ref.color.hintContainer,

        hintStyle: ref.typo.headline5.copyWith(
            fontWeight: ref.typo.light, color: ref.color.onHintContainer),

        hintText: widget.hint,

        /// padding
        contentPadding: const EdgeInsets.symmetric(
          vertical: 11.5,
          horizontal: 16,
        ),

        suffixIcon: controller.text.isNotEmpty
            ? null
            : Button(
                icon: 'close',
                type: ButtonType.flat,
                onPressed: () {
                  setState(() {
                    controller.clear();
                    widget.onClear?.call();
                  });
                }),
      ),
    );
  }
}
