part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class ResetPasswordInitialEvent extends ResetPasswordEvent {}

class ResetPasswordSuccessfullyEvent extends ResetPasswordEvent {
  final String email;
  ResetPasswordSuccessfullyEvent({required this.email});
}
