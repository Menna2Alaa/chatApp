import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/cubits/chatCubit/chat_cubit.dart';
import 'package:scholar_chat_app/cubits/loginCubit/login_cubit.dart';
import 'package:scholar_chat_app/cubits/registreCubit/register_cubit.dart';
import 'package:scholar_chat_app/firebase_options.dart';
import 'package:scholar_chat_app/screens/chat_screen.dart';
import 'package:scholar_chat_app/screens/login_screen.dart';
import 'package:scholar_chat_app/screens/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  const ScholarChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        initialRoute: 'LoginScreen',
      ),
    );
  }
}
