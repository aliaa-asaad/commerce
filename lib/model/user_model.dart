class UserModel {
  String? name, userId, picture, email;

  UserModel({this.name, this.email, this.picture, this.userId});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    email = map['email'];
    name = map['name'];
    picture = map['picture'];
    userId = map['userId'];
  }

  toJson() {
    return {'email': email, 'name': name, 'picture': picture, 'userId': userId};
  }
}
