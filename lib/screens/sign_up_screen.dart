// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/helper/show_snakbar.dart';
import 'package:scholar_chat_app/screens/chat_screen.dart';
import 'package:scholar_chat_app/widgets/custome_button.dart';
import 'package:scholar_chat_app/widgets/custome_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(kLogo, height: 150),
                Center(
                  child: Text(
                    'Scholar Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'assets/fonts/Pacifico-Regular.ttf',
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                SizedBox(height: 10),
                CustomeTextFormField(
                  onChanged: (data) {
                    email = data;
                  },
                  text: 'Email',
                ),
                SizedBox(height: 10),
                CustomeTextFormField(
                  onChanged: (data) {
                    password = data;
                  },
                  text: 'Password',
                ),
                SizedBox(height: 10),
                CustomeButton(
                  buttonText: 'Sign Up',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoding = true;
                      setState(() {});
                      Navigator.pushNamed(
                        context,
                        ChatScreen.id,
                        arguments: email,
                      );
                      try {
                        await registerUser();
                        showSnakBar(context, 'success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnakBar(context, 'weak password');
                        } else if (e.code == 'email-already-in-use') {
                          showSnakBar(context, 'email already exists');
                        }
                      } catch (e) {
                        showSnakBar(context, 'There is an error');
                      }
                      isLoding = false;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
