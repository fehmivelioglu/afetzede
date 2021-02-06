class UserModel {
  String uid;
  String userName;
  String place;
  int oncelik;
  String key;

  UserModel({this.uid, this.userName, this.place, this.oncelik});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    place = json['place'];
    oncelik = json['oncelik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['userName'] = this.userName;
    data['place'] = this.place;
    data['oncelik'] = this.oncelik;
    return data;
  }
}

class UsersList {
  List<UserModel> userArray = [];

  UsersList.fromJsonList(Map value) {
    value.forEach((key, value) {
      var user = UserModel.fromJson(value);
      // aidat.id=value;
      // if(aidat.key=="id"){
      //   aidat.id=value;
      // }else {
      user.key = key;
      // }

      userArray.add(user);
      // notifyListeners();
    });
  }
  // AidatList();

}
