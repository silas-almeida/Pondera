import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pondera/helpers/firebase-errors.dart';
import 'package:pondera/models/classes/user.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  PonderaUser user;
  User firebaseUser;

  UserProvider() {
    _loadCurrentUser();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _loadCurrentUser({User firebaseUser}) async {
    final User currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      loading = true;
      final DocumentSnapshot docUser =
          await firestore.collection('users').doc(currentUser.uid).get();
      this.user = PonderaUser.fromDocument(docUser);
      this.firebaseUser = currentUser;
      loading = false;
    } else {
      print('Current user nulo');
    }
    notifyListeners();
  }

  Future<void> signUp(
      {PonderaUser user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      user.id = result.user.uid;
      this.user = user;
      await user.saveData();
      firebaseUser = result.user;
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> signIn(
      {PonderaUser user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      user.id = result.user.uid;
      _loadCurrentUser(firebaseUser: result.user);
      onSuccess();
    } on PlatformException catch (error) {
      onFail(getErrorString(error.code));
    }
    loading = false;
  }

  void signOut() {
    auth.signOut();
    user = null;
    firebaseUser = null;
    notifyListeners();
  }
}
