import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  late Future<Map<String, dynamic>> practiceTexts;
  bool isLangKor = true;
  String lang = 'kor';

  Future<Map<String, dynamic>> loadData() async {
    String jsonData = await rootBundle.loadString('assets/practice_text.json');
    return jsonDecode(jsonData);
  }

 
}
