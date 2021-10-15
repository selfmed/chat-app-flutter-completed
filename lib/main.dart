import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/registration_page.dart';
import 'package:chat_app/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      initialRoute: 'welcome_page',
      routes: {
        'welcome_page': (context) => WelcomePage(),
        'registration_page': (context) => RegistrationPage(),
        'login_page': (context) => LoginPage(),
        'chat_page': (context) => ChatPage(),
      },
    );
  }
}
