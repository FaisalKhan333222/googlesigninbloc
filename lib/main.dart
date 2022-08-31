import 'package:faisalbloc/bloc/resetpasswordbloc/reset_password_bloc.dart';
import 'package:faisalbloc/bloc/signinbloc/sign_in_bloc.dart';
import 'package:faisalbloc/bloc/signupbloc/sign_up_bloc.dart';
import 'package:faisalbloc/navigation/app_navigation.dart';
import 'package:faisalbloc/screens/signinscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => ResetPasswordBloc(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: NavigationPage.getPage,
        home: SignInScreen(),
      ),
    );
  }
}
