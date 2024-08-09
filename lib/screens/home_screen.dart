import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/login_cubit/login_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';

import '../constants/components.dart';
import '../widgets/home_body.dart';
import 'auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(),
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  elevation: 3,
                  shadowColor: Colors.grey,
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {
                          LoginCubit.get(context).logOut();
                          navigateToReplacement(context, const LoginScreen());
                        },
                        icon: Icon(
                          Icons.logout,
                          size: 30,
                        ))
                  ],
                  title: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "NEWS",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                        TextSpan(
                            text: " APP",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    ),
                  )),
              body: const HomeBody())),
    );
  }
}
