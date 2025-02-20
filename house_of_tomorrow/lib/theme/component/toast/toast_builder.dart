import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class ToastBuilder extends ConsumerStatefulWidget {
  const ToastBuilder({
    super.key,
    required this.text,
    required this.animDuration,
  });

  final String text;
  final Duration animDuration;

  @override
  ConsumerState<ToastBuilder> createState() => ToastBuilderState();
}

class ToastBuilderState extends ConsumerState<ToastBuilder> {
  bool _isShow = false;
  bool get isShow => _isShow;

  set isShow(bool value) {
    setState(() {
      _isShow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Size screenSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: screenSize.height * 0.25,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: ref.color.toastContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: DefaultTextStyle(
            style: ref.typo.headline6.copyWith(
              color: ref.color.onToastContainer,
            ),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}
