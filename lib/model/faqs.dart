import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class FAQs {
 late int id;
 late String questionEn;
 late String questionAr;
 late String answerEn;
 late String answerAr;


 String get question =>SharedPrefController().language=="ar"?questionAr:questionEn;
 String get answer =>SharedPrefController().language=="ar"?answerAr:answerEn;
  FAQs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionAr = json['question_ar'];
    answerEn = json['answer_en'];
    answerAr = json['answer_ar'];
  }
}