import 'package:flutter/material.dart';

import '../../../../core/theme/base_colors.dart';

class OnBoardingItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  const OnBoardingItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: BaseColors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Image.asset(
              imageUrl,
              scale: 2,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
