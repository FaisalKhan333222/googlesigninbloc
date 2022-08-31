part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInInitialEvent extends SignInEvent {}

class SignInSuccessfullyEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSuccessfullyEvent({required this.email, required this.password});
}

class SignInWithGoogleSuccessfullyEvent extends SignInEvent {}
