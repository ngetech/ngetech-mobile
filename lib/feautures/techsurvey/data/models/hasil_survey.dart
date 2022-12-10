// Generated from https://app.quicktype.io/
// To parse this JSON data, do
//
//     final hasilTechSurvey = hasilTechSurveyFromJson(jsonString);

import 'dart:convert';

HasilTechSurvey hasilTechSurveyFromJson(String str) =>
    HasilTechSurvey.fromJson(json.decode(str));

String hasilTechSurveyToJson(HasilTechSurvey data) =>
    json.encode(data.toJson());

class HasilTechSurvey {
  HasilTechSurvey({
    required this.result,
    required this.date,
  });

  String result;
  String date;

  factory HasilTechSurvey.fromJson(Map<String, dynamic> json) =>
      HasilTechSurvey(
        result: json["result"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "date": date,
      };
}
