import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/auth/login_screen.dart';
import 'package:instagram_clone_app/core/utility/validator.dart';
import 'package:instagram_clone_app/services/auth_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var appValidator = AppValodator();

  final authService = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var isLoading = true;

  Future<void> _submitForm() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      var data = {
        "userName": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text,
      };
      await authService.createUser(data, context);
      setState(() {
        isLoading = false;
      });
    }
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
                  controller: _userNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: _buildInputDecoration("Username", Icons.person),
                  validator: appValidator.validateUser),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
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
              TextFormField(
                controller: _phoneController,
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
                validator: appValidator.validatePhoneNumber,
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
                      : const Text('Create'),
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
