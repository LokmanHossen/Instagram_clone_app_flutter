import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/auth/sign_up.dart';
import 'package:instagram_clone_app/body_view.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      checkAuthState();
    });
    super.initState();
  }

  void checkAuthState() {
    User? user = _auth.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const Bodyview())));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const SignUpScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
