part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;
  final String userName;

  SignUpSubmitted({
    required this.email,
    required this.password,
    required this.userName,
  });
}
