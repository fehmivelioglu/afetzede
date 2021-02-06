class UserModel {
  int id;
  String userName;
  String password;
  String email;
  int oncelik;
  String key;

  UserModel({this.id, this.userName,this.password,this.email,this.oncelik});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
    oncelik = json['oncelik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['email'] = this.email;
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