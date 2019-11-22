import 'package:jobhuntbuddy/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  final String uid;
  final String email;

  UserModel({
    this.uid,
    @required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email
    };
  }

  @override
  List<Object> get props => [email];
}
