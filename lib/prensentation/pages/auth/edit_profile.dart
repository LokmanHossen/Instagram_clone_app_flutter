import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/core/utility/validator.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/widgets/media_picker.dart';
import 'package:instagram_clone_app/services/auth_services.dart';
import 'package:instagram_clone_app/services/firestore_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.userDetails});

  final Map<String, dynamic> userDetails;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var appValidator = AppValodator();
  var authService = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  // final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final _desController = TextEditingController();
  final _urlController = TextEditingController();
  final firestoreService = FirestoreServices();

  var isLoading = false;
  var profileUrl;

  @override
  void initState() {
    setState(() {
      _userNameController.text = widget.userDetails['userName'];
      _emailController.text = widget.userDetails['email'];
      _phoneController.text = widget.userDetails['phone'];
      _bioController.text = widget.userDetails['bio'];
      _desController.text = widget.userDetails['des'];
      _urlController.text = widget.userDetails['url'];
      profileUrl = widget.userDetails['profileUrl'];
    });
    super.initState();
  }

  var mediaPicker = MediaPicker();

  imageUpload() async {
    var imagefile = await mediaPicker.imgPicker();
    if (imagefile != null) {}
  }

  uploadFile() {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('flutter-test')
        .child('/some-image.jpg');

    try {} on FirebaseException catch (e) {}
  }

  Future<void> _submitForm() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "id": widget.userDetails['id'],
        "userName": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "bio": _bioController.text,
        "des": _desController.text,
        "profileUrl": profileUrl,
        "url": _urlController.text,
      };
      await firestoreService.updateUser(data, context);

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
      appBar: AppBar(
        title: Text("Update Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: const Color(0xCAF15800),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage("profileUrl"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                        onPressed: () {
                          imageUpload();
                        },
                        icon: Icon(Icons.edit)),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              // const SizedBox(
              //   width: 150,
              //   child: Text(
              //     'Create New account',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 28,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
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
              // TextFormField(
              //   controller: _passwordController,
              //   keyboardType: TextInputType.emailAddress,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   style: const TextStyle(color: Colors.white),
              //   decoration: _buildInputDecoration("Password", Icons.lock),
              //   validator: appValidator.validatePassword,
              // ),

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
              TextFormField(
                controller: _bioController,
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration(
                  "Bio",
                  Icons.copy_all_sharp,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _desController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration:
                    _buildInputDecoration("Description", Icons.description),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _desController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: _buildInputDecoration("url", Icons.description),
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
                      : const Text('Update'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const LogInScreen(),
              //         ));
              //   },
              //   child: const Text(
              //     'Login',
              //     style: TextStyle(
              //       color: Color(0xFFA66703),
              //       fontSize: 24,
              //     ),
              //   ),
              // )
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
