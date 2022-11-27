import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';

import '../widget/about_ngetech_card.dart';
import '../widget/kudos_developer_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ABOUT NGETECH'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Column(
              children: [
                AboutNgeTechCard(deviceWidth: deviceWidth),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: deviceWidth,
                    decoration: BoxDecoration(
                      color: BaseColors.charcoal.shade800,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            color: BaseColors.blue,
                            child: const Center(
                              child: Text(
                                'FAQ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: BaseColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'FAQ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: BaseColors.white,
                          ),
                        ),
                        const Text(
                          'FAQ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: BaseColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                KudosDeveloperCard(deviceWidth: deviceWidth),
              ],
            ),
          ),
        ),
        backgroundColor: BaseColors.charcoal,
      ),
    );
  }
}
