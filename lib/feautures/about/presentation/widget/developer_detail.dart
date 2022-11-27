import 'package:flutter/material.dart';

import '../../../../core/theme/base_colors.dart';

class DeveloperDetail extends StatelessWidget {
  final String name;
  final String detail;
  final String imagePath;
  const DeveloperDetail({
    Key? key,
    required this.name,
    required this.detail,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: BaseColors.charcoal,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    detail,
                    style: TextStyle(
                      color: BaseColors.charcoal.shade600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}