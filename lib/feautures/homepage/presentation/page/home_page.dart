import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';

import '../widget/feature_card.dart';
import '../widget/hope_and_target_card.dart';
import '../widget/informative_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    String _greets() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Pagi';
      }
      if (hour < 16) {
        return 'Siang';
      }
      if (hour < 18) {
        return 'Sore';
      }
      return 'Malam';
    }

    final List<String> titles = [
      'Melekin Teknologi',
      'Top 5 Post',
      'Posting Artikel',
      'Bebas Bereaksi',
      'Seberapa NgeTech',
      'Forum Diskusi',
    ];

    final List<String> contents = [
      'Kami memberikan anda tempat serta sumber-sumber untuk memperoleh informasi berguna mengenai perkembangan teknologi di zaman ini',
      'Kami menawarkan anda 5 informasi terhangat mengenai teknologi yang sedang demanding di masa kini',
      'Berkembang bersama dengan saling membagikan informasi-informasi seputar pengalaman anda atau teknologi yang sedang hangat di masa kini',
      'Anda dibebaskan untuk memberikan pendapat terhadap suatu postingan orang lain dengan memberikan komentar ke dalam Post Tech orang lain',
      'Cari tahu seberapa melek anda terhadap perkembangan teknologi-teknologi yang sedang hangat di masa kini',
      'Kami menyediakan anda tempat untuk melakukan diskusi dengan komunitas Ngetech',
    ];

    final List<String> imagesPath = [
      'assets/images/melekin_teknologi.png',
      'assets/images/top_five_post.png',
      'assets/images/post_tech.png',
      'assets/images/bebas_bereaksi.png',
      'assets/images/seberapa_ngetech.png',
      'assets/images/forum_diskusi.png',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(28, 32, 28, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Halo!',
                            style: TextStyle(
                              color: BaseColors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Selamat ${_greets()}!',
                            style: TextStyle(
                              color: BaseColors.charcoal.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: BaseColors.charcoal.shade700,
                        child: LineIcon(
                          LineIcons.userLock,
                          color: BaseColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: BaseColors.charcoal.shade600,
                  height: 12,
                  thickness: 0.5,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 28, 12),
            child: Center(
              child: Text(
                'Rekomendasi hari ini\nuntuk Mu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BaseColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CarouselSlider.builder(
            itemCount: titles.length,
            itemBuilder: (
              BuildContext context,
              int itemIndex,
              int pageViewIndex,
            ) =>
                FeatureCard(
              title: titles[itemIndex],
              content: contents[itemIndex],
              deviceWidth: deviceWidth,
              imagePath: imagesPath[itemIndex],
            ),
            options: CarouselOptions(
              height: 400,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          InformativeCard(
            deviceWidth: deviceWidth,
          ),
          HopeAndTargetCard(
            deviceWidth: deviceWidth,
          ),
        ],
      ),
    );
  }
}
