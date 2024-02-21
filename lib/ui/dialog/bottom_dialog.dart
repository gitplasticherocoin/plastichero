import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plastichero/constants/common.dart';


class BottomDialog extends StatelessWidget {
  final Widget? child;

  const BottomDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double disHeight = MediaQuery.of(context).size.height;
    EdgeInsets bottomEdge = MediaQuery.of(context).viewInsets;
    double topPadding = window.viewPadding.top / window.devicePixelRatio;

    return Padding(
      padding: bottomEdge,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: disHeight - bottomEdge.bottom - topPadding),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Common.bottomDialogRadius),
            topRight: Radius.circular(Common.bottomDialogRadius),
          ),
          color: Colors.white,
        ),
        clipBehavior: Clip.hardEdge,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
