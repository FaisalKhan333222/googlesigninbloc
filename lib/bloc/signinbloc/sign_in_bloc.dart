import 'package:bloc/bloc.dart';
import 'package:faisalbloc/firebase_webapis/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInInitialEvent>((event, emit) {
      emit.call(SignInInitialState());
    });

    on<SignInSuccessfullyEvent>((event, emit) async {
      try {
        User? user = await signInUser(event.email, event.password);
        emit.call(SignInSuccessfullyState(user: user!));
      } catch (e) {
        emit.call(SignInFailedState(message: e.toString()));
      }
    });
    on<SignInWithGoogleSuccessfullyEvent>((event, emit) async {
      try {
        UserCredential userCredential = await signInWithGoogle();
        emit.call(
            SignInWithGoogleSuccessfullyState(userCredential: userCredential));
      } catch (e) {
        emit.call(SignInWithGoogleFailedState(message: e.toString()));
      }
    });
    on<SignInWithFacebookSuccessfullyEvent>((event, emit) async {
      try {
        UserCredential userCredential = await signInWithFacebook();
        emit.call(SignInWithFacebookSuccessfullyState(
            userCredential: userCredential));
      } catch (e) {
        emit.call(SignInWithFacebookFailedState(message: e.toString()));
      }
    });
  }
}
