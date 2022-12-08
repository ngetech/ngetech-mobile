import 'package:flutter/material.dart';
import 'package:ngetech/services/cookies_request.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CookieRequest.init();
  runApp(App());
}
