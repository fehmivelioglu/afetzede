import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:the_afetzede/core/models/user_model.dart';

class RealTimeDBService {
  String _firebaseURL;

  static RealTimeDBService _instance = RealTimeDBService._privateConstructor();

  RealTimeDBService._privateConstructor() {
    _firebaseURL =
        'https://afetzede-29894-default-rtdb.europe-west1.firebasedatabase.app/';
  }

  static RealTimeDBService getInstance() {
    if (_instance == null) {
      return RealTimeDBService._privateConstructor();
    } else {
      return _instance;
    }
  }

  Future<List<UserModel>> getUsers() async {
    final response = await http.get(_firebaseURL + 'users.json');

    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final userList = UsersList.fromJsonList(jsonResponse);
        print(userList.userArray);

        return userList.userArray;
        break;
      default:
    }
    return Future.error(jsonResponse);
  }
}
