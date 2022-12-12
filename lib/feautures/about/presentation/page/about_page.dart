import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';

import '../widget/about_ngetech_card.dart';
import '../widget/faq_section.dart';
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
                FaqSection(deviceWidth: deviceWidth),
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