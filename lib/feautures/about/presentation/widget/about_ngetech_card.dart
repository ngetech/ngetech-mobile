import 'package:flutter/material.dart';

import '../../../../core/theme/base_colors.dart';

class AboutNgeTechCard extends StatelessWidget {
  const AboutNgeTechCard({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
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
                'ALIRAN TEKNOLOGI MASA KINI',
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
                'Tentang Kami ',
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
              'NgeTech adalah segala hal yang berkaitan dengan teknologi masa kini. NgeTech menawarkan banyak hal bagi penggunanya mulai dari berbagai informasi mengenai teknologi masa kini, ulasan informasi, hingga forum untuk berdiskusi. Cakupan lingkup NgeTech adalah untuk membuka mata komunitas bahwa teknologi kian tangkas bermigrasi dari budaya terdahulu hingga ke masa kini yang penuh dengan abstraksi. NgeTech menyadari bahwa pusat perputaran teknologi menciptakan generasi baru yang konsumtif terhadap digitalisasi dunia. Dengan demikian, NgeTech hadir dalam dunia yang terdistraksi dengan teknologi untuk mengantar serta membawa revolusi terhadap digitalisasi teknologi sebagai misi dari G20.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: BaseColors.charcoal.shade600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}