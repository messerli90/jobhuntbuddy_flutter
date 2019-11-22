import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class Uninitialized extends AuthState {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthState {
  final UserModel user;

  Authenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { user.email: ${user.email} }';
}

class Unauthenticated extends AuthState {
  @override
  List<Object> get props => null;

  @override
  String toString() => 'Unauthenticated';
}

class Error extends AuthState {
  final String error;

  Error(this.error);

  @override
  String toString() => 'Error {error message: $error}';

  @override
  List<Object> get props => null;
}
