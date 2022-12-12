// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/feautures/about/presentation/page/about_page.dart';

import '../../../../core/theme/base_colors.dart';

class HopeAndTargetCard extends StatelessWidget {
  const HopeAndTargetCard({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(28, 28, 28, 28),
      padding: const EdgeInsets.all(16),
      width: deviceWidth,
      decoration: BoxDecoration(
        color: BaseColors.charcoal.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'NGETECH',
                  style: TextStyle(
                    color: BaseColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              LineIcon(
                LineIcons.certificate,
                color: BaseColors.blue,
              )
            ],
          ),
          Divider(
            color: BaseColors.charcoal.shade600,
            height: 12,
            thickness: 0.5,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              'Kami berharap',
              style: TextStyle(
                color: BaseColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              'Dapat membuka mata masyarakat akan tangkasnya permigrasian teknologi dari budaya yang terdahulu hingga ke masa kini yang penuh dengan abstraksi.',
              style: TextStyle(
                color: BaseColors.charcoal.shade600,
                fontSize: 16,
              ),
            ),
          ),
          Divider(
            color: BaseColors.charcoal.shade600,
            height: 12,
            thickness: 0.5,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Kami menargetkan',
              style: TextStyle(
                color: BaseColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: BaseColors.charcoal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: RotatedBox(
                          quarterTurns: 45,
                          child: LineIcon(
                            LineIcons.rockHand,
                            color: BaseColors.blue,
                            size: 32,
                          )),
                    ),
                    Text(
                      'Mematahkan gap teknologi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: BaseColors.charcoal.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: BaseColors.charcoal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: LineIcon(
                        LineIcons.boxes,
                        color: BaseColors.blue,
                        size: 32,
                      ),
                    ),
                    Text(
                      'Penyedia sumber daya memadai',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: BaseColors.charcoal.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: BaseColors.charcoal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 4),
                      child: LineIcon(
                        LineIcons.running,
                        color: BaseColors.blue,
                        size: 32,
                      ),
                    ),
                    Text(
                      'Transformasi kultur',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: BaseColors.charcoal.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: BaseColors.charcoal.shade600,
            height: 12,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: const Text(
              'Siapa kami?',
              style: TextStyle(
                color: BaseColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              'Sekilas tentang kami adalah segala hal yang berkaitan dengan teknologi di masa kini. Selebihnya mengenai kami dapat Anda ditemui di bawah ini',
              style: TextStyle(
                color: BaseColors.charcoal.shade600,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
              child: const Text('Tentang NgeTech'),
            ),
          )
        ],
      ),
    );
  }
}
