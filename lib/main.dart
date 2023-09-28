import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/auth/auth_gate.dart';
import 'package:instagram_clone_app/prensentation/widgets/body_view.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: const Color(0xFFA47C04),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? const TextStyle(
                    color: Color(0xFFA47C04),
                  )
                : const TextStyle(),
          ),
          // iconTheme: MaterialStateProperty.resolveWith(
          //   (states) => states.contains(MaterialState.selected)
          //       ? const IconThemeData(
          //           size: 30,
          //         )
          //       : const IconThemeData(),
          // ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: OnBordaring(),
      home: const Bodyview(),
      // home: const AuthGate(),
    );
  }
}
