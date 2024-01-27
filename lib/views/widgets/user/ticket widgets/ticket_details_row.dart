import 'package:flutter/material.dart';
import 'package:shoufibokra/utils/themes/app_themes.dart';

class TicketDetailsRow extends StatelessWidget {
  final bool title;
  final List<String> titles;
  const TicketDetailsRow({
    super.key,
    this.title = false,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleStyle = darkTheme.textTheme.displayMedium;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titles[0],
          style: title
              ? titleStyle
              : darkTheme.textTheme.displaySmall!.copyWith(color: Colors.black),
        ),
        Text(
          titles[1],
          style: title
              ? titleStyle
              : darkTheme.textTheme.displaySmall!.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
