class UserModel {
  String uid;
  String userName;
  String place;
  String oncelik;
  String key;

  UserModel({this.uid, this.userName, this.place, this.oncelik});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    place = json['place'];
    oncelik = json['oncelik'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['userName'] = userName;
    data['place'] = place;
    data['oncelik'] = oncelik;
    return data;
  }
}

class UsersList {
  List<UserModel> userArray = [];

  UsersList.fromJsonList(Map value) {
    value.forEach((key, value) {
      var user = UserModel.fromJson(value);

      user.key = key;

      userArray.add(user);
    });
  }
}
