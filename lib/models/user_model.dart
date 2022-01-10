class UserModel {
  String userId, name, pic;
   late final String? email;

  UserModel(
      {required this.userId,
      this.email,
      required this.name,
      required this.pic});

  fromJson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    email = map['email'] as String?;
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
