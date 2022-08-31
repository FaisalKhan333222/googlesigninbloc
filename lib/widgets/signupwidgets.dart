import 'package:faisalbloc/bloc/signinbloc/sign_in_bloc.dart';
import 'package:faisalbloc/bloc/signupbloc/sign_up_bloc.dart';
import 'package:faisalbloc/models/usermodel.dart';
import 'package:faisalbloc/screens/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpInitialUI extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController secondNameTextEditingController =
      TextEditingController();
  SignUpInitialUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpBloc = Provider.of<SignUpBloc>(context, listen: false);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text('SignUp Screen'),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 80,
              width: 200,
              child: TextFormField(
                controller: firstNameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'First Name',
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
              height: 80,
              width: 200,
              child: TextFormField(
                controller: secondNameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Second Name',
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
                  var modal = UserModel(
                    email: emailTextEditingController.text,
                    firstName: firstNameTextEditingController.text,
                    secondName: secondNameTextEditingController.text,
                    password: passwordTextEditingController.text,
                  );
                  signUpBloc.add(SignUpSuccessfullyEvent(userModal: modal));
                },
                child: Text('SignUp')),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: GestureDetector(
                  onTap: () {
                    Provider.of<SignInBloc>(context, listen: false)
                        .add(SignInInitialEvent());
                    Navigator.pushReplacementNamed(
                        context, SignInScreen.PAGE_NAME);
                  },
                  child: Text('Click To SignIn')),
            ),
          ],
        ),
      ),
    );
  }
}
