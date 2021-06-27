import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_stick/components/constants.dart';
import 'package:smart_stick/models/user_model.dart';
import 'package:smart_stick/modules/login/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(AppLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(AppLoginSuccessState(value.user.uid));
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorState(error.toString()));
    });
  }

  final DatabaseReference db = FirebaseDatabase().reference();

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
  }) {
    emit(AppRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
        name: name,
        email: email,
        password: password,
        qrcode: qrcode,
        uId: value.user.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(AppRegisterErrorState(error.toString()));
    });
  }

  void createUser({
    @required String name,
    @required String email,
    @required String password,
    @required String uId,
    @required String qrcode,
  }) {
    UserModel model = UserModel(
      name: name,
      password: password,
      email: email,
      uId: uId,
      qrcode: qrcode =
          'https://thecityfix.com/wp-content/uploads/2019/10/Open-Streets-Dog_IT.jpg',
      isEmailVerified: false,
      latitude: 31.040720,
      longitude: 31.382469,
    );

    db.child('Users').child(uId).set(model.toMap()).then((value) {
      emit(AppCreateUserSuccessState(uId));
    }).catchError((error) {
      emit(AppCreateUserErrorState(error));
    });
  }

// To update Message Image in Home Screen
  void updateUser({String qrcode}) {
    emit(AppUpdateUserLoadingState());

    db.child('Users').child(uid).update({'qrcode': qrcode}).then((value) {
      print("User Updated");
      emit(AppUpdateUserSuccessState());
    }).catchError((error) {
      print("Failed to update user: $error");
      emit(AppUpdateUserErrorState(error));
    });
  }

  void getDataFromDataBase() {
    db.once().then((value) {
      print(value.value);
    }).catchError((error) {});
  }
}
