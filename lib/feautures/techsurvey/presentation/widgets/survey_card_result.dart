import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/theme/base_colors.dart';

class SurveyCardResult extends StatelessWidget {
  final String? result;
  const SurveyCardResult({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12, bottom: 6),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 18),
      decoration: BoxDecoration(
        color: BaseColors.charcoal.shade800,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: LineIcon(
            LineIcons.lockOpen,
            color: BaseColors.blue,
            size: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Title(
                color: BaseColors.white,
                child: const Text(
                  "Hasil Survey Terakhir",
                  style: TextStyle(
                    height: 1.8,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: BaseColors.blue,
                  ),
                ),
              ),
              Text(
                result != '' ? result! : 'Belum ada riwayat',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                  color: BaseColors.blue.shade100,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

