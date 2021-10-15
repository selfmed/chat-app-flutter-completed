import 'package:chat_app/streams/register_streams.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _registerStreams = RegisterStreams();
  final _auth = FirebaseAuth.instance;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('lib/images/logo.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            StreamBuilder<bool>(
              stream: _registerStreams.isLoading,
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldInputDecoration.copyWith(
                icon: Icon(Icons.email_sharp),
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldInputDecoration.copyWith(
                  icon: Icon(Icons.password_sharp),
                  hintText: 'Enter your password',
                )),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  _registerStreams.isLoadingToggle.add(true);
                  try {
                    final newUserCredential =
                        await _auth.createUserWithEmailAndPassword(
                            email: email!, password: password!);

                    // ignore: unnecessary_null_comparison
                    if (newUserCredential != null) {
                      Navigator.pushNamed(context, 'chat_page');
                    }
                  } catch (e) {
                    print(e);
                  }
                  _registerStreams.isLoadingToggle.add(false);
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  elevation: MaterialStateProperty.all(8),
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
