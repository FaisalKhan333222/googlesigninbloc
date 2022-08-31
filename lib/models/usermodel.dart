class UserModel {
  String? email;
  String? password;
  String? firstName;
  String? secondName;
  String? uid;
  UserModel(
      {this.email, this.password, this.firstName, this.secondName, this.uid});

  UserModel.fromMap(Map<String, dynamic> map)
      : email = map['email'],
        password = map['password'],
        firstName = map['firstName'],
        secondName = map['secondName'],
        uid = map['uid'];

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'secondName': secondName,
      'uid': uid,
    };
  }
}
