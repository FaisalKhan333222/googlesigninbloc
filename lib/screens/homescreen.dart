import 'package:faisalbloc/bloc/signinbloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String PAGE_NAME = 'homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signInBloc = Provider.of<SignInBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              signInBloc.add(SignInInitialEvent());
              Navigator.pop(context);
            },
            icon: Text('clikc'),
          )
        ],
      ),
    );
  }
}
