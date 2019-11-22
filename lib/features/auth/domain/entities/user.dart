import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String uid;
  final String email;

  User({
    this.uid,
    @required this.email
  });

  @override
  List<Object> get props => [email];
}
