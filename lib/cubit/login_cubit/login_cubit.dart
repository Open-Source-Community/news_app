import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/login_cubit/login_states.dart';

import '../../constants/components.dart';
import '../../services/firebase/firebase_auth_helper.dart';



class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  static String userName = "";
  static String userEmail = "";
  bool visible = false;
  bool isPassword = true;

  void login() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      print("Valid");
      await FireBaseHelper()
          .SignIn(email.text.toString(), password.text.toString())
          .then((value) => {
                if (value is User)
                  {
                    userName = value.displayName!.toString(),
                    userEmail = value.email!.toString(),
                    print(userEmail),
                    print(userName),
                    email.clear(),
                    password.clear(),
                    emit(LoginClearTextController()),
                    emit(LoginSuccessState()),
                  }
                else
                  {
                    emit(LoginErrorState()),
                    showToast(text: value.toString(), color: Colors.red),
                  }
              });
    } else {
      print("Not Valid");
    }
  }

  void showPassword() {
    visible = !visible;
    isPassword = !isPassword;
    emit(LoginChangePasswordIconState());
  }

  void loginWithGoogle() async {
    email.clear();
    password.clear();
    emit(LoginClearTextController());
    await FireBaseHelper().signInWithGoogle();
    emit(LoginWithGoogleState());
  }

  void goToSignUp() {
    email.clear();
    password.clear();
    emit(LoginClearTextController());
    emit(LoginGoToSignUpState());
  }

  void logOut() {
    FireBaseHelper().SignOut();
    emit(LogoutState());
  }
}
