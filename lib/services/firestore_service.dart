import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class FirestoreServices {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   CollectionReference users = FirebaseFirestore.instance.collection('users');

//   Future<void> addUser(data) async {
//     try {
//       await users.doc(data['id']).set(data);
//     } catch (error) {
//       print("Failed to add user : $error");
//       throw error;
//     }
//   }

//   Future<void> updateUser(data, context) async {
//     try {
//       await users.doc(data['id']).update(data);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Account Update")));
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Account Update")));
//     } catch (error) {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text("Updation Failed"),
//               content: Text(error.toString()),
//             );
//           });

//       throw error;
//     }
//   }
// }

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(data) async {
    try {
      await users.doc(data['id']).set(data);
    } catch (error) {
      print("Failed to add user: $error");
      throw error;
    }
  }

  Future<void> updateUser(data, context) async {
    try {
      await users.doc(data['id']).update(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Accout Updated")));
    } catch (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("updation Failed"),
              content: Text(error.toString()),
            );
          });
      throw error;
    }
  }
}
