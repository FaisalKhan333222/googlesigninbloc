import 'package:faisalbloc/bloc/resetpasswordbloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/forgetpasswordwidgets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        builder: (context, state) {
          if (state is ResetPasswordInitialState) {
            return ForgetPasswordInitialWidget();
          } else if (state is ResetPasswordSuccessfullyState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Code Sent'),
                ),
              );
            });

            return SizedBox();
          } else if (state is ResetPasswordFailedState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.toString(),
                  ),
                ),
              );
            });
            return ForgetPasswordInitialWidget();
          } else {
            return Center(
              child: Text('Builder Error'),
            );
          }
        },
      ),
    );
  }
}
