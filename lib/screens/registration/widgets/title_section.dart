import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/theme.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      "Hello\nSignup to\nget started",
      textAlign: TextAlign.start,
      style: AppTheme.themeData.textTheme.titleLarge,
    );
  }
}