import 'package:faisalbloc/bloc/resetpasswordbloc/reset_password_bloc.dart';
import 'package:faisalbloc/bloc/signinbloc/sign_in_bloc.dart';
import 'package:faisalbloc/screens/signupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/signupbloc/sign_up_bloc.dart';
import '../screens/forgetpasswordscreen.dart';

class SignInInitialUI extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  SignInInitialUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signInBloc = Provider.of<SignInBloc>(context, listen: false);

    final forgetPasswordBloc =
        Provider.of<ResetPasswordBloc>(context, listen: false);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text('SignIn Screen'),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 80,
              width: 200,
              child: TextFormField(
                controller: emailTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              width: 200,
              child: TextFormField(
                controller: passwordTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  signInBloc.add(SignInSuccessfullyEvent(
                      email: emailTextEditingController.text,
                      password: passwordTextEditingController.text));
                },
                child: Text('SignIn')),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              child: GestureDetector(
                  onTap: () {
                    forgetPasswordBloc.add(ResetPasswordInitialEvent());
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ForgetPasswordScreen();
                      },
                    ));
                  },
                  child: Text('Forgot Password',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline))),
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {
                  signInBloc.add(SignInWithGoogleSuccessfullyEvent());
                },
                icon: Icon(Icons.golf_course),
                label: Text('Sign iN With Google'),
              ),
            ),
            SizedBox(
              height: 40,
              child: GestureDetector(
                  onTap: () {
                    final signUpBloc =
                        Provider.of<SignUpBloc>(context, listen: false);
                    signUpBloc.add(SignUpInitialEvent());
                    Navigator.pushReplacementNamed(
                        context, SignUpScreen.PAGE_NAME);
                  },
                  child: Text('Click To SignUp')),
            ),
          ],
        ),
      ),
    );
  }
}
