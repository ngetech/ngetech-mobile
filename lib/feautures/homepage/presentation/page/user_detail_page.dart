import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/core/theme/base_colors.dart';

import 'main_page.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: LineIcon(
                LineIcons.times,
              ),
            ),
          )
        ],
        leading: Container(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 14,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: deviceWidth * 0.25,
                    backgroundColor: BaseColors.charcoal.shade700,
                    child: LineIcon(
                      size: deviceWidth * 0.3,
                      LineIcons.user,
                      color: BaseColors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Currently loggin as",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    request.getCurrentUser()!,
                    
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final response = await request.logout(EndPoints.logout);
                  print(response['status']);
                  if (response['status']) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        response['message'],
                        style: const TextStyle(
                          color: BaseColors.white,
                        ),
                      ),
                      backgroundColor: BaseColors.blue,
                    ));
                    Future.delayed(
                      const Duration(seconds: 4),
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      ),
                    );
                  } else {}
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomePage(),
                  //   ),
                  // );
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
