import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/auth/sign_up.dart';
import 'package:instagram_clone_app/services/auth_services.dart';

import '../../../core/utility/validator.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var appValidator = AppValodator();
  var authService = AuthService();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  var isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };
      await authService.loginUser(data, context);

      setState(() {
        isLoading = false;
      });
    }
  }

  // //Email validation check
  // String? _validateEmail(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter an email';
  //   }
  //   RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   if (!emailRegExp.hasMatch(value)) {
  //     return 'Please enter a valid email';
  //   }
  //   return null;
  // }

  // //Password validation check
  // String? _validatePassword(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter Your Password';
  //   }

  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252634),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  child: Text(
                    'Welcome to LoginPage',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Login to Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration("Email", Icons.email),
                  validator: appValidator.validateEmail,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration("Password", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                const SizedBox(
                  height: 10,
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
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Login'),
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
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Create new Account',
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
