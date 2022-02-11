import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/space.dart';

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    var result = await http.get(
      Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'),
    );

    if (kDebugMode) {
      print(result.statusCode);
      print(result.body);
    }

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((data) => Space.fromJson(data)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
