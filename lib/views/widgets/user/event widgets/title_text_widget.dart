import 'package:flutter/material.dart';

import '../../../../utils/themes/app_themes.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: darkTheme.textTheme.displaySmall,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
