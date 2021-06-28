import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_stick/components/constants.dart';
import 'package:smart_stick/models/user_model.dart';
import 'package:smart_stick/modules/home_cubit/cubit/states.dart';
import 'package:smart_stick/modules/home_cubit/screens/live_screen.dart';
import 'package:smart_stick/modules/home_cubit/screens/settings_screen.dart';
import 'package:smart_stick/modules/home_cubit/screens/home_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;
  List<String> title = ['Settings', 'Location tracker', 'Home'];
  List<Widget> screens = [
    SettingsScreen(),
    LiveScreen(),
    HomeScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  UserModel model = UserModel();
  final DatabaseReference db = FirebaseDatabase().reference();

  void getUserData() {
    emit(AppGetUserLoadingState());

    db.once().then((value) {
      print(' -------------My Data-------------------');
      print(value.value['Users'][uid]);

      name = value.value['Users'][uid]['name'];
      uid = value.value['Users'][uid]['uId'];
      qrcode = value.value['Users'][uid]['qrcode'];
      email = value.value['Users'][uid]['email'];
      password = value.value['Users'][uid]['password'];
      latitude = value.value['Users'][uid]['latitude'];
      longitude = value.value['Users'][uid]['longitude'];

      emit(AppGetUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(AppGetUserErrorState(error));
    });
  }

  void updateUser({String uname, String uemail, String upassword}) {
    emit(AppProfileUserUpdateLoadingState());

    db.child('Users').child(uid).update(
      {
        'name': uname,
        'email': uemail,
        'password': upassword,
      },
    ).then((value) {
      name = uname;
      email = uemail;
      password = upassword;

      print("Profile User Updated");
      emit(AppProfileUserUpdateSuccessState());
    }).catchError((error) {
      print("Failed to update profile user: $error");
      emit(AppProfileUserUpdateErrorState(error));
    });
  }
}
