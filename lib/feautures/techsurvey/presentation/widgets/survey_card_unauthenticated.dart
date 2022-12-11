import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/theme/base_colors.dart';
import '../../../authentication/presentation/pages/login_page.dart';

class SurveyCardUnauthenticated extends StatelessWidget {
  const SurveyCardUnauthenticated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12.0, bottom: 6.0),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 18),
      decoration: BoxDecoration(
        color: BaseColors.charcoal.shade800,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: LineIcon(
              LineIcons.lock,
              color: BaseColors.blue,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  "Riwayat terkunci.",
                  style: TextStyle(
                    height: 1.6,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: BaseColors.blue,
                  ),
                ),
                Text(
                  "Login untuk melihat riwayat hasil survey!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 15,
                    color: BaseColors.blue.shade100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text("Login"),
            ),
          )
        ],
      ),
    );
  }
}
