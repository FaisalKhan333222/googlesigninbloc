import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faisalbloc/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

// Future<DocumentSnapshot> getData()async{
//    DocumentSnapshot snapshot= await firebaseFirestore.collection('users').doc('sx').get().then((value) {
//    });
// }
