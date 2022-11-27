import 'package:flutter/material.dart';

import '../../../../core/theme/base_colors.dart';
import 'developer_detail.dart';

class KudosDeveloperCard extends StatelessWidget {
  const KudosDeveloperCard({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                'Kudos Developer',
                style: TextStyle(
                  color: BaseColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const DeveloperDetail(
              name: 'Wayan Angga Putra Aldita',
              detail: 'Sistem Informasi 2021',
              imagePath: 'assets/images/Angga.jpg',
            ),
            Divider(
              color: BaseColors.charcoal.shade600,
              height: 12,
              thickness: 0.5,
            ),
            const DeveloperDetail(
              name: 'Glan Harithteguh',
              detail: 'Ilmu Komputer 2021',
              imagePath: 'assets/images/Glan.jpg',
            ),
            Divider(
              color: BaseColors.charcoal.shade600,
              height: 12,
              thickness: 0.5,
            ),
            const DeveloperDetail(
              name: 'Bonaventura Galang Kristabel Angipanglipur Hatmasasmita',
              detail: 'Ilmu Komputer 2021',
              imagePath: 'assets/images/Bona.jpg',
            ),
            Divider(
              color: BaseColors.charcoal.shade600,
              height: 12,
              thickness: 0.5,
            ),
            const DeveloperDetail(
              name: 'Joselin Permata Aprillia',
              detail: 'Ilmu Komputer 2021',
              imagePath: 'assets/images/Joselin.jpg',
            ),
            Divider(
              color: BaseColors.charcoal.shade600,
              height: 12,
              thickness: 0.5,
            ),
            const DeveloperDetail(
              name: 'Abdillah Sulthan Naufal Panggabean',
              detail: 'Sistem Informasi 2021',
              imagePath: 'assets/images/Sulthan.jpg',
            ),
          ],
        ),
      ),
    );
  }
}