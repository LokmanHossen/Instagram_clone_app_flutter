import 'package:flutter/material.dart';
import 'package:instagram_clone_app/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text(
            'Form submit Successfully',
          ),
        ),
      );
    }
  }

//user validation check
  String? _validateUser(value) {
    if (value!.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  //Email validation check
  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  //Password validation check
  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter Your Password';
    }

    return null;
  }

//Phone validation check
  String? _validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Please enter Your phone number';
    }
    if (value.length != 10) {
      return 'Please enter a 10 digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const SizedBox(
                width: 150,
                child: Text(
                  'Create New account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration("Username", Icons.person),
                validator: _validateUser,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration("Email", Icons.email),
                //  InputDecoration(
                //   labelText: 'Email',
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // ),
                validator: _validateEmail,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration("Password", Icons.lock),
                validator: _validatePassword,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration("Phone Number", Icons.phone),
                // InputDecoration(
                //   labelText: 'phone',
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // ),
                validator: _validatePhoneNumber,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA66703),
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Create'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFFA66703),
                    fontSize: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
      fillColor: const Color(0xAA494A59),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x35949494),
        ),
      ),
      filled: true,
      labelStyle: const TextStyle(
        color: Color(0xFF949494),
      ),
      labelText: label,
      suffixIcon: Icon(
        suffixIcon,
        color: const Color(0xFF949494),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
