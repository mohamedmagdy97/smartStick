abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates {}

class AppLoginLoadingState extends AppLoginStates {}

class AppLoginSuccessState extends AppLoginStates {
  final String uid;

  AppLoginSuccessState(this.uid);
}

class AppLoginErrorState extends AppLoginStates {
  final String error;

  AppLoginErrorState(this.error);
}

class AppRegisterLoadingState extends AppLoginStates {}

class AppRegisterSuccessState extends AppLoginStates {}

class AppRegisterErrorState extends AppLoginStates {
  final String error;

  AppRegisterErrorState(this.error);
}

class AppCreateUserLoadingState extends AppLoginStates {}

class AppCreateUserSuccessState extends AppLoginStates {
  final String uid;

  AppCreateUserSuccessState(this.uid);
}

class AppCreateUserErrorState extends AppLoginStates {
  final String error;

  AppCreateUserErrorState(this.error);
}
class AppUpdateUserLoadingState extends AppLoginStates {}

class AppUpdateUserSuccessState extends AppLoginStates {}

class AppUpdateUserErrorState extends AppLoginStates {
  final String error;

  AppUpdateUserErrorState(this.error);
}
