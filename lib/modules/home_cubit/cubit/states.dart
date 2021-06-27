abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class AppProfileUserUpdateLoadingState extends AppStates {}

class AppProfileUserUpdateSuccessState extends AppStates {}

class AppProfileUserUpdateErrorState extends AppStates {
  final String error;

  AppProfileUserUpdateErrorState(this.error);
}