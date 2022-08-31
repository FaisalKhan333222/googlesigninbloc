import 'package:faisalbloc/bloc/resetpasswordbloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordInitialWidget extends StatelessWidget {
  ForgetPasswordInitialWidget({Key? key}) : super(key: key);
  final TextEditingController resetEmailPasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final resetPasswordBloc =
        Provider.of<ResetPasswordBloc>(context, listen: false);
    return Center(
      child: Column(
        children: [
          Text('Reset Your Password'),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: resetEmailPasswordTextEditingController,
            decoration: InputDecoration(
              hintText: 'Enter Email Here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                resetPasswordBloc.add(ResetPasswordSuccessfullyEvent(
                    email: resetEmailPasswordTextEditingController.text));
              },
              child: Text('Send Code'))
        ],
      ),
    );
  }
}
