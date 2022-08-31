import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../firebase_webapis/auth.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpInitialEvent>((event, emit) {
      emit.call(SignUpInitialState());
    });
    on<SignUpSuccessfullyEvent>((event, emit) async {
      try {
        User? user = await signUpUser(event.userModal);
        emit.call(SignUpSuccessfullyState(user: user!));
      } catch (e) {
        emit.call(SignUpFailedState(message: e.toString()));
      }
    });
  }
}
