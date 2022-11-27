import 'package:flutter/material.dart';

import '../../../../core/theme/base_colors.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;
  final double deviceWidth;

  const FeatureCard({
    Key? key,
    required this.title,
    required this.content,
    required this.deviceWidth,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: const EdgeInsets.all(16),
      width: deviceWidth,
      height: deviceWidth,
      decoration: BoxDecoration(
        color: BaseColors.charcoal.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: BaseColors.charcoal,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Text(
              title,
              style: const TextStyle(
                color: BaseColors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: BaseColors.charcoal.shade600,
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              content,
              style: TextStyle(
                color: BaseColors.charcoal.shade600,
                fontSize: 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Jelajahi lebih jauh...',
              style: TextStyle(
                color: BaseColors.blue,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
