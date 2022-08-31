import 'package:faisalbloc/bloc/signupbloc/sign_up_bloc.dart';
import 'package:faisalbloc/screens/signinscreen.dart';
import 'package:faisalbloc/widgets/signupwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static const String PAGE_NAME = 'signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final signUpBloc = Provider.of<SignUpBloc>(context, listen: false);
    // signUpBloc.add(SignUpInitialEvent());
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is SignUpInitialState) {
                return SignUpInitialUI();
              } else if (state is SignUpSuccessfullyState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.pushReplacementNamed(
                      context, SignInScreen.PAGE_NAME);
                });
                return SizedBox();
              } else if (state is SignUpFailedState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message.toString()),
                    ),
                  );
                });
                return SignUpInitialUI();
              } else {
                return Center(
                  child: Text('Builder Error'),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
