// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/helper/show_snakbar.dart';
import 'package:scholar_chat_app/screens/chat_screen.dart';
import 'package:scholar_chat_app/screens/sign_up_screen.dart';
import 'package:scholar_chat_app/widgets/custome_button.dart';
import 'package:scholar_chat_app/widgets/custome_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;

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
                  'Sign In',
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
                  isSecure: true,
                  onChanged: (data) {
                    password = data;
                  },
                  text: 'Password',
                ),
                SizedBox(height: 10),
                CustomeButton(
                  buttonText: 'Sign In',
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
                        await SignIn();
                        showSnakBar(context, 'success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnakBar(context, 'user not found');
                        } else if (e.code == 'wrong-password') {
                          showSnakBar(context, 'incorrect password');
                        }
                      } catch (e) {
                        print(e);
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
                      'don’t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
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

  Future<void> SignIn() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
