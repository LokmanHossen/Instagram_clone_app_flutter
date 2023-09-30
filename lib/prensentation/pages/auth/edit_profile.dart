import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/core/utility/validator.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/widgets/media_picker.dart';
import 'package:instagram_clone_app/services/auth_services.dart';
import 'package:instagram_clone_app/services/firestore_service.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key, required this.userDetails});

//   final Map<String, dynamic> userDetails;

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   var appValidator = AppValodator();
//   var authService = AuthService();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final _userNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   // final _passwordController = TextEditingController();
//   final _bioController = TextEditingController();
//   final _desController = TextEditingController();
//   final _urlController = TextEditingController();
//   final firestoreService = FirestoreServices();

//   var isLoading = false;
//   var isLoadingProfile = false;
//   var profileUrl;

//   @override
//   void initState() {
//     setState(() {
//       _userNameController.text = widget.userDetails['userName'];
//       _emailController.text = widget.userDetails['email'];
//       _phoneController.text = widget.userDetails['phone'];
//       _bioController.text = widget.userDetails['bio'];
//       _desController.text = widget.userDetails['des'];
//       _urlController.text = widget.userDetails['url'];
//       profileUrl = widget.userDetails['profileUrl'];
//     });
//     super.initState();
//   }

//   var mediaPicker = MediaPicker();

//   imageUpload() async {
//     var imagefile = await mediaPicker.imgPicker();
//     if (imagefile != null) {
//       uploadFile(File(imagefile));
//     }
//   }

//   uploadFile(File selectedFile) async {
//     setState(() {
//       isLoadingProfile = true;
//     });
//     Reference ref = FirebaseStorage.instance
//         .ref()
//         .child('files')
//         .child(selectedFile.path.split('/').last);

//     try {
//       var uploadTask = await ref.putFile(selectedFile);
//       var downloadUrl = await ref.getDownloadURL();
//       setState(() {
//         profileUrl = downloadUrl;
//       });
//       setState(() {
//         isLoadingProfile = false;
//       });
//     } on FirebaseException catch (e) {
//       setState(() {
//         isLoadingProfile = false;
//       });
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('uploadTask Failed'),
//               content: Text(e.toString()),
//             );
//           });
//     }
//   }

//   Future<void> _submitForm() async {
//     setState(() {
//       isLoading = true;
//     });
//     if (_formKey.currentState!.validate()) {
//       Map<String, dynamic> data = {
//         "id": widget.userDetails['id'],
//         "userName": _userNameController.text,
//         "email": _emailController.text,
//         "phone": _phoneController.text,
//         "bio": _bioController.text,
//         "des": _desController.text,
//         "profileUrl": profileUrl,
//         "url": _urlController.text,
//       };
//       await firestoreService.updateUser(data, context);

//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color(0xFF252634),
//       appBar: AppBar(
//         title: const Text("Update Account"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         width: 4,
//                         color: const Color(0xCAF15800),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: isLoadingProfile
//                           ? const Center(child: CircularProgressIndicator())
//                           : CircleAvatar(
//                               radius: 35,
//                               backgroundImage: NetworkImage(profileUrl),
//                             ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: IconButton(
//                         onPressed: () {
//                           imageUpload();
//                         },
//                         icon: const Icon(Icons.edit)),
//                   ),
//                 ],
//               ),

//               const SizedBox(
//                 height: 20,
//               ),
//               // const SizedBox(
//               //   width: 150,
//               //   child: Text(
//               //     'Create New account',
//               //     textAlign: TextAlign.center,
//               //     style: TextStyle(
//               //       color: Colors.white,
//               //       fontSize: 28,
//               //       fontWeight: FontWeight.bold,
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                   controller: _userNameController,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   style: const TextStyle(
//                     color: Colors.white,
//                   ),
//                   decoration: _buildInputDecoration("Username", Icons.person),
//                   validator: appValidator.validateUser),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: _buildInputDecoration("Email", Icons.email),
//                 //  InputDecoration(
//                 //   labelText: 'Email',
//                 //   border: OutlineInputBorder(
//                 //     borderRadius: BorderRadius.circular(10),
//                 //   ),
//                 // ),
//                 validator: appValidator.validateEmail,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               // TextFormField(
//               //   controller: _passwordController,
//               //   keyboardType: TextInputType.emailAddress,
//               //   autovalidateMode: AutovalidateMode.onUserInteraction,
//               //   style: const TextStyle(color: Colors.white),
//               //   decoration: _buildInputDecoration("Password", Icons.lock),
//               //   validator: appValidator.validatePassword,
//               // ),

//               TextFormField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: _buildInputDecoration("Phone Number", Icons.phone),
//                 // InputDecoration(
//                 //   labelText: 'phone',
//                 //   border: OutlineInputBorder(
//                 //     borderRadius: BorderRadius.circular(10),
//                 //   ),
//                 // ),
//                 validator: appValidator.validatePhoneNumber,
//               ),

//               const SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 controller: _bioController,
//                 keyboardType: TextInputType.text,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: _buildInputDecoration(
//                   "Bio",
//                   Icons.copy_all_sharp,
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 controller: _desController,
//                 keyboardType: TextInputType.text,
//                 style: const TextStyle(
//                   color: Colors.white,
//                 ),
//                 decoration:
//                     _buildInputDecoration("Description", Icons.description),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 controller: _desController,
//                 keyboardType: TextInputType.text,
//                 style: const TextStyle(
//                   color: Colors.white,
//                 ),
//                 decoration: _buildInputDecoration("url", Icons.description),
//               ),

//               SizedBox(
//                 height: 50,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFA66703),
//                     textStyle: const TextStyle(fontSize: 24),
//                   ),
//                   onPressed: _submitForm,
//                   child: isLoading
//                       ? const Center(
//                           child: CircularProgressIndicator(),
//                         )
//                       : const Text('Update'),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               // TextButton(
//               //   onPressed: () {
//               //     Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //           builder: (context) => const LogInScreen(),
//               //         ));
//               //   },
//               //   child: const Text(
//               //     'Login',
//               //     style: TextStyle(
//               //       color: Color(0xFFA66703),
//               //       fontSize: 24,
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
//     return InputDecoration(
//       fillColor: const Color(0xAA494A59),
//       enabledBorder: const OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Color(0x35949494),
//         ),
//       ),
//       filled: true,
//       labelStyle: const TextStyle(
//         color: Color(0xFF949494),
//       ),
//       labelText: label,
//       suffixIcon: Icon(
//         suffixIcon,
//         color: const Color(0xFF949494),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.userDetails});
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
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final _desController = TextEditingController();
  final _urlController = TextEditingController();
  final firestoreService = FirestoreService();

  var isLoader = false;
  var isLoaderProfile = false;
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
    if (imagefile != null) {
      uploadFile(File(imagefile));
    }
  }

  uploadFile(File selectedFile) async {
    setState(() {
      isLoaderProfile = true;
    });
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);
    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      setState(() {
        profileUrl = downloadUrl;
      });
      setState(() {
        isLoaderProfile = false;
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoaderProfile = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("uploadTask Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
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
        isLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF252634),
        appBar: AppBar(
          title: const Text("Update Account"),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: isLoaderProfile
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(profileUrl),
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
                                icon: const Icon(Icons.edit))),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        controller: _userNameController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            _buildInputDecoration("Username", Icons.person),
                        validator: appValidator.validateUser),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: _buildInputDecoration("Email", Icons.email),
                        validator: appValidator.validateEmail),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration:
                          _buildInputDecoration("Phone number", Icons.call),
                      validator: appValidator.validatePhoneNumber,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _bioController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.phone,
                      decoration:
                          _buildInputDecoration("Bio", Icons.copy_all_sharp),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _desController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: _buildInputDecoration(
                          "Description", Icons.description),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _urlController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: _buildInputDecoration("url", Icons.link),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF15900)),
                            onPressed: _submitForm,
                            child: isLoader
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const Text("Update",
                                    style: TextStyle(fontSize: 20)))),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                )),
          ),
        ));
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: const Color(0xAA494A59),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: const TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: const Color(0xFF949494),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
