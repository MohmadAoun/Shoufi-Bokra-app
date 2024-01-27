import 'package:flutter/material.dart';

class AddVerticalSpace extends StatelessWidget {
  final double height;
  final bool visible;
  const AddVerticalSpace({
    super.key,
    required this.height,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: SizedBox(
        height: height,
      ),
    );
  }
}

class AddHorizontalSpace extends StatelessWidget {
  final double width;
  final bool visible;
  const AddHorizontalSpace({
    super.key,
    required this.width,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: SizedBox(
        width: width,
      ),
    );
  }
}
