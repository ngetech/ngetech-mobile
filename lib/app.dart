import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/app_theme.dart';

import 'feautures/homepage/presentation/page/main_page.dart';

class App extends StatelessWidget {
  final AppTheme _appTheme = AppTheme();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _appTheme.darkTheme(),
      home: const MainPage(),
    );
  }
}

