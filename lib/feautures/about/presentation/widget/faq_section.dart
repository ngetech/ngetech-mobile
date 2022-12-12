import 'package:flutter/material.dart';

import '../../../../core/theme/base_colors.dart';
import '../../data/models/expansion_item.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  final List<ExpansionItem> items = [
    ExpansionItem(
      header: 'Apa itu Ngetech?',
      body:
          'Sekilas tentang kami adalah segala hal yang berkaitan dengan teknologi masa kini, kami menawarkan banyak hal bermanfaat bagi masyarakat mulai dari berbagai informasi mengenai teknologi masa kini, ulasan informasi, hingga forum untuk berdiskusi.',
    ),
    ExpansionItem(
        header: 'Apa tujuan Ngetech?',
        body:
            'Kami sangat menyadari bahwa pusat perputaran teknologi menciptakan generasi baru yang konsumtif pada zaman digitaisasi ini. Oleh karena itu, kami hadir dalam dunia yang terdistraksi dengan teknologi untuk mengantar serta membawakan revolusi terhadap digitalisasi teknologi.'),
    ExpansionItem(
        header: 'Apakah saya memerlukan akun untuk menggunakan aplikasi ini?',
        body:
            'Anda tidak memerlukan akun untuk melakukan survey seberapa Ngetech, melihat 5. Postingan Tech terhangat, serta menelusuri lebih jauh lagi tentang Ngetech itu sendiri.'),
    ExpansionItem(
        header: 'Dimana saya dapat membuat akun?',
        body: 'Pembuatan account dapat anda lakukan di sini.        '),
    ExpansionItem(
        header: 'Apakah keamanan pengguna terjamin pada aplikasi ini?',
        body:
            'Ngetech dapat menjamin keamanan pengguna pada situs ini dengan menjamin privasi data pengguna.'),
    ExpansionItem(
        header: 'Tipe kuesioner apa yang digunakan pada survey Ngetech?',
        body:
            'Kuesioner yang digunakan pada survey Ngetech memanfaatkan Tipe Skala Likert, menggunakan referensi survey yang dilakukan oleh Kominfo untuk mengetahui status Literasi Digital Indonesia, yang diadakan pada tahun 2020. Selain itu, survey ini juga dilakukan untuk mengukur minat responden dalam mendukung tujuan G20, terutama pada topik Transformasi Digital.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: widget.deviceWidth,
        decoration: BoxDecoration(
          color: BaseColors.charcoal.shade800,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: ExpansionPanelList(
                elevation: 0,
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    if (items[index].isExpanded) {
                      for (var element in items) {
                        element.isExpanded = false;
                      }
                    } else {
                      for (var element in items) {
                        element.isExpanded = false;
                      }
                      items[index].isExpanded = true;
                    }
                  });
                },
                children: items.map((ExpansionItem item) {
                  return ExpansionPanel(
                    backgroundColor: Colors.transparent,
                    headerBuilder: (context, isExpanded) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.header,
                          style: const TextStyle(
                            color: BaseColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.body,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: BaseColors.charcoal.shade600,
                          ),
                        ),
                      ],
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
