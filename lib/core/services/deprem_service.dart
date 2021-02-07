import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_afetzede/core/models/deprem_model.dart';

class DepremService {
  final _depremUrl = 'https://turkiyedepremapi.herokuapp.com/api';

  Future<List<DepremModel>> getDeprems() async {
    // ignore: omit_local_variable_types
    List<DepremModel> _depremList = [];
    final response = await http.get(_depremUrl);
    Iterable jsonResponse = json.decode(response.body);
    _depremList = (json.decode(response.body) as List)
        .map((e) => DepremModel.fromJson(e))
        .toList();

    if (response.statusCode == 200) {
      return _depremList;
    } else {
      return Future.error(jsonResponse);
    }
  }
}
