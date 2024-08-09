import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/signup_cubit/signup_cubit.dart';
import '../../../cubit/signup_cubit/signup_states.dart';

import '../../constants/components.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbody.dart';
import '../../widgets/auth/customtextfieldform.dart';
import '../../widgets/auth/customtextsign.dart';
import '../home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                child: Form(
                  key: cubit.keystate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextBodyAuth(
                          textitle: "Sign Up",
                          textbody:
                              "Enter username & your email & valid password to create account "),
                      const SizedBox(height: 50),
                      CustomTextFormAuth(
                        keyboardType: TextInputType.text,
                        validate: (val) {
                          return validInput(val!, 5, 15, "username");
                        },
                        labeltext: "Username",
                        hinttext: "Enter username",
                        mycontroller: cubit.username,
                        suffix: IconButton(
                            icon: const Icon(Icons.person),
                            onPressed: () {},
                            color: Colors.blue),
                      ),
                      CustomTextFormAuth(
                        keyboardType: TextInputType.emailAddress,
                        validate: (val) {
                          return validInput(val!, 5, 50, "email");
                        },
                        labeltext: "Email",
                        hinttext: "Enter your Email",
                        mycontroller: cubit.email,
                        suffix: IconButton(
                            icon: const Icon(Icons.email_outlined),
                            onPressed: () {},
                            color: Colors.blue),
                      ),
                      CustomTextFormAuth(
                        keyboardType: TextInputType.visiblePassword,
                        validate: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        labeltext: "Password",
                        hinttext: "Enter your password",
                        isPassword: cubit.isPassword,
                        mycontroller: cubit.password,
                        suffix: IconButton(
                            icon: Icon(cubit.visible
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_sharp),
                            onPressed: () {
                              cubit.showPassword();
                            },
                            color: Colors.blue),
                      ),
                      CustomButtonAuth(
                        text: "Sign Up",
                        onPressed: () async {
                          cubit.signUp();
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextSign(
                        text: "Already have an account? ",
                        sign: "Log In",
                        onTap: () {
                          cubit.goToLogin();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast(text: "Sign Up Successfully", color: Colors.green);
          navigateToReplacement(context, HomeScreen());
        } else if (state is SignUpGoToLogin) {
          navigateToReplacement(context, const LoginScreen());
        }
      },
    );
  }
}
