abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {}

class LoginChangePasswordIconState extends LoginStates {}

class LoginGoToSignUpState extends LoginStates {}

class LoginWithGoogleState extends LoginStates {}

class LogoutState extends LoginStates {}

class LoginClearTextController extends LoginStates {}
