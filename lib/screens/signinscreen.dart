import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signinbloc/sign_in_bloc.dart';
import '../widgets/signinwidgets.dart';
import 'homescreen.dart';

class SignInScreen extends StatelessWidget {
  static const String PAGE_NAME = 'signin';

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var signinBloc = Provider.of<SignInBloc>(context, listen: false);
    // signinBloc.add(SignInInitialEvent());
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInInitialState) {
            return SignInInitialUI();
          } else if (state is SignInSuccessfullyState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.pushNamed(context, HomeScreen.PAGE_NAME);
            });
            return SizedBox();
          } else if (state is SignInWithGoogleSuccessfullyState) {
            print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5');
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.pushNamed(context, HomeScreen.PAGE_NAME);
            });
            print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
            return SizedBox();
          } else if (state is SignInWithGoogleFailedState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message.toString()),
                ),
              );
            });
            return SignInInitialUI();
          } else if (state is SignInFailedState) {
            return Container(
              color: Colors.red,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
