import 'package:bloc/bloc.dart';
import 'package:faisalbloc/firebase_webapis/auth.dart';
import 'package:meta/meta.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitialState()) {
    on<ResetPasswordInitialEvent>((event, emit) {
      emit.call(ResetPasswordInitialState());
    });

    on<ResetPasswordSuccessfullyEvent>((event, emit) async {
      try {
        await resetPassword(event.email);
        emit.call(ResetPasswordSuccessfullyState());
      } catch (e) {
        emit.call(ResetPasswordFailedState(message: e.toString()));
      }
    });
  }
}
