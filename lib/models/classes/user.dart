import 'package:cloud_firestore/cloud_firestore.dart';

class PonderaUser {
  PonderaUser({this.email, this.password, this.name, this.id});

  PonderaUser.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    email = document.data()['email'] as String;
    cpf = document.data()['cpf'] as String;
  }

  String id;
  String name;
  String email;
  String cpf;
  String password;
  String confirmPassword;
  bool admin = false;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      if (cpf != null) 'cpf': cpf,
    };
  }

  void setCpf(String cpf) {
    this.cpf = cpf;
    saveData();
  }

  String getInitials() {
    if (name.isNotEmpty) {
      String initials = '';
      final splitedName = name.split(' ');
      for (final fractionName in splitedName) {
        initials = initials + fractionName[0];
      }
      return initials.toUpperCase();
    }
    return null;
  }

  // Future<void> saveToken() async {
  //   final String token = await FirebaseMessaging().getToken();
  //   tokensReference.document(token).setData({
  //     'token': token,
  //     'updatedAt': FieldValue.serverTimestamp(),
  //     'platform': Platform.operatingSystem,
  //   });
  // }
}
