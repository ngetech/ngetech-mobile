import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/core/theme/app_theme.dart';

import 'feautures/homepage/presentation/page/main_page.dart';
import 'services/cookies_request.dart';

class App extends StatelessWidget {
  final AppTheme _appTheme = AppTheme();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _appTheme.darkTheme(),
        home: const MainPage(),
      ),
    );
  }
}
