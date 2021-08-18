import 'package:fioma/models/user.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class UnAuth extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
