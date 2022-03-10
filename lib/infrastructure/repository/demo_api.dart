import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/infrastructure/models/demo_model.dart';
import 'package:http/http.dart' as http;

class DemoModelApi {
  late Map jsonData;
  late List apiData;

  getApi() async {
    List<DemoModel> essentialData = [];
    http.Response response =
        await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);

      essentialData.clear();
      // debugPrint(jsonData.toString());

      return DemoModel(
        status: jsonData['status'],
        message: jsonData['message'],
      );
    }

    // for (var element in essentialData) {
    //   debugPrint("\n\nStatus\n${element.status}");
    // }
  }
}
