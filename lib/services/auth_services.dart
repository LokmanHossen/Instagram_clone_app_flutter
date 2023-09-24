import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/widgets/body_view.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> createUser(data, context) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const Bodyview())));
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('SignUp Failed'),
              content: Text(e.toString()),
            );
          });
    }
  }
}