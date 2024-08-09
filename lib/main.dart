import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/services/bloc_observer.dart';
import 'package:news_app/constants/components.dart';
import 'package:news_app/cubit/news_cubit.dart';



import 'cubit/login_cubit/login_cubit.dart';
import 'cubit/signup_cubit/signup_cubit.dart';
import 'services/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===============================User is currently signed out!');
      } else {
        LoginCubit.userName = user.displayName!.toString();
        LoginCubit.userEmail = user.email!.toString();
        print('===============================User is signed in!');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => SignUpCubit()),
          BlocProvider(create: (context) => NewsCubit()),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: start()
        ));
  }
}
