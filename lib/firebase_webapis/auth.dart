import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faisalbloc/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

Future<User?> signInUser(String email, String password) async {
  UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: password);
  User? user = userCredential.user;
  return user;
}

Future signUpUser(UserModel userModel) async {
  UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: userModel.email!, password: userModel.password!);
  User? user = userCredential.user;
  userModel.uid = user!.uid;
  if (user != null) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toMap());
    return user;
  }
  return user;
  // if (user != null) {
  //   firebaseFirestore.collection('users').doc(user.uid).set(model.toMap());
}

Future resetPassword(String email) async {
  await auth.sendPasswordResetEmail(email: email);
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser =
      await GoogleSignIn(scopes: <String>['Email']).signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

ImagePicker imagePicker = ImagePicker();
File? image;
Future<File?> pickImage() async {
  var pick = await imagePicker.pickImage(source: ImageSource.gallery);
  if (pick != null) {
    image = File(pick.path);
    return image;
  } else {
    Text('data');
  }
  return image;
}

// Future<DocumentSnapshot> getData()async{
//    DocumentSnapshot snapshot= await firebaseFirestore.collection('users').doc('sx').get().then((value) {
//    });
// }
Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
