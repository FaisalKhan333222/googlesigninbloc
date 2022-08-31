part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {}

class SignUpSuccessfullyEvent extends SignUpEvent {
  var userModal;
  SignUpSuccessfullyEvent({required this.userModal});
}
