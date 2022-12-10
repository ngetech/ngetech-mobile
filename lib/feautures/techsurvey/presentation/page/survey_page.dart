import "package:flutter/material.dart";
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<String> questions = [
    "Saya mampu mencari dan mengakses informasi di media digital sesuai kebutuhan.",
    "Saya dapat dengan mudah menyaring informasi dan mampu mendeteksi berita bohong (hoax) di media sosial.",
    "Saya mampu menggunakan media digital sebagai wadah berinteraksi dan komunikasi.",
    "Saya seringkali mencari informasi mengenai G20, khususnya pada topik Transformasi Digital pada berbagai aspek kehidupan.",
    "Saya menyadari dan mendukung pentingnya Transformasi Digital di era perkembangan digital saat ini.",
    "Saya siap akan konsekuensi bahwa apa yang saya tulis di media sosial dapat diakses banyak orang dan dapat meninggalkan jejak digital.",
    "Saya terbiasa mengkaji ulang dan memeriksa kebenaran informasi yang saya temui di media digital.",
    "Saya memanfaatkan proses digitalisasi dalam kehidupan sehari-hari, contohnya dalam bertransaksi online, digital learning, dan lain-lain.",
  ];

  List<Map<String, Object>> choices = [
    {
      'text': 'Tidak pernah',
      'score': 0,
    },
    {
      'text': 'Jarang',
      'score': 1,
    },
    {
      'text': 'Lumayan sering',
      'score': 2,
    },
    {
      'text': 'Sangat sering',
      'score': 3,
    },
  ];

  late List<double> skor = [for (var i = 0; i < questions.length; i++) 0];

  String get result {
    String result;
    double totalSkor = skor.fold(0, (p, c) => p + c);
    if (totalSkor >= 20) {
      result = 'Sobat Ngetech abiez!';
    } else if (totalSkor >= 15) {
      result = 'Tech enthusiasts';
    } else if (totalSkor >= 10) {
      result = 'Great start!';
    } else if (totalSkor >= 5) {
      result = 'Ngetech lagi yuk!';
    } else {
      result = 'Kurang ngetech';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BaseColors.charcoal,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 14,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: LineIcon(
                          LineIcons.paste,
                          color: BaseColors.blue,
                          size: 40,
                        ),
                      ),
                      const Positioned(
                        child: Text(
                          "TECH SURVEY",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: BaseColors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 12.0, bottom: 6.0),
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 18),
                  decoration: BoxDecoration(
                    color: BaseColors.charcoal.shade800,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(children: [
                    Title(
                      color: BaseColors.white,
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hasil Hasil Survey",
                            style: TextStyle(
                                height: 1.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: BaseColors.blue),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "\nDiambil pada",
                        style: TextStyle(
                            height: 1.6,
                            color: BaseColors.blue.shade100,
                            fontSize: 15),
                      ),
                    ),
                  ]),
                ),
                for (int i = 0; i < questions.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 12.0, bottom: 6.0),
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                    decoration: BoxDecoration(
                      color: BaseColors.charcoal.shade800,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      children: [
                        Title(
                          color: BaseColors.white,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pertanyaan ${i + 1}",
                                style: const TextStyle(
                                    height: 1.8,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: BaseColors.blue),
                              )),
                        ),
                        Text(
                          questions[i],
                          style: TextStyle(
                              height: 1.6,
                              color: BaseColors.blue.shade100,
                              fontSize: 15),
                        ),
                        Slider(
                          value: skor[i],
                          min: 0,
                          max: 3,
                          divisions: 3,
                          label: '${choices[skor[i].round()]['text']}',
                          onChanged: (value) {
                            setState(() {
                              skor[i] = value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(choices[0]['text'].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: BaseColors.charcoal.shade600,
                                )),
                            Text(choices[3]['text'].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: BaseColors.charcoal.shade600,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: BaseColors.charcoal.shade800,
                              title: const Text(
                                "Hasil Tech Survey",
                                style: TextStyle(color: BaseColors.blue),
                              ),
                              content: Text(
                                result,
                                style:
                                    TextStyle(color: BaseColors.blue.shade100),
                              ),
                              actions: <Widget>[
                                Center(
                                  child: ElevatedButton(
                                    child: const Text(
                                      "Tutup",
                                      style: TextStyle(color: BaseColors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Lihat Hasil'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
