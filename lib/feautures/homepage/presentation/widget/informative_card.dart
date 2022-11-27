import 'package:flutter/material.dart';

import '../../../../core/theme/base_colors.dart';

class InformativeCard extends StatelessWidget {
  const InformativeCard({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(28, 28, 28, 0),
      padding: const EdgeInsets.all(16),
      width: deviceWidth,
      decoration: BoxDecoration(
        color: BaseColors.charcoal.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              'PENGETAHUAN ADALAH KUNCINYA',
              style: TextStyle(
                color: BaseColors.blue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              'Berkembang dalam Pesatnya Transformasi Budaya',
              style: TextStyle(
                color: BaseColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: BaseColors.charcoal.shade600,
            height: 12,
            thickness: 0.5,
          ),
          Text(
            'Kami memberi Anda tempat untuk berbagi informasi yang memadai mengenai teknologi terbaru di masa kini yang sedang demanding',
            style: TextStyle(
              color: BaseColors.charcoal.shade600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
