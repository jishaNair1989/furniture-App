import 'package:my_furniture_app/models/user_model.dart';

class UserModel{
  int? id;
  final String username;
  final String password;

  UserModel({required this.username,required this.password});
  static UserModel fromMap (Map< String, Object?>map)
  {
    final id =map['id'] as int;
    final username=map['username'] as String;
    final password=map['password'] as String;

    return UserModel(username: username, password: password);
  }
}