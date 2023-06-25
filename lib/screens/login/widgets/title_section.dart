import 'package:flutter/material.dart';
import 'package:notifire/utilities/theme.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      'Hello Again!\nWelcome\nback',
      textAlign: TextAlign.start,
      style: AppTheme.themeData.textTheme.titleLarge,
    );
  }
}