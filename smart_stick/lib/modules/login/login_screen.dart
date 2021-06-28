import '../../components/colors.dart';
import '../../components/components.dart';
import '../../components/constants.dart';
import '../../modules/home_cubit/home_layout.dart';
import '../../modules/login/cubit/cubit.dart';
import '../../modules/login/cubit/states.dart';
import '../../network/local/cache_helper.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppLoginCubit>(
      create: (context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          if (state is AppLoginSuccessState) {
            CacheHelper.saveDate(key: 'uid', value: state.uid).then((value) {
              uid = state.uid;
              navigateAndFinish(context, HomeLayout());
              Toast.show(
                'Login Successful',
                context,
                duration: Toast.LENGTH_LONG,
                backgroundColor: Colors.green,
              );
            });
          } else if (state is AppLoginErrorState) {
            print(state.error);
            Toast.show(
              state.error,
              context,
              duration: Toast.LENGTH_LONG,
              backgroundColor: Colors.red,
            );
          }
        },
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/logo2.png',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: secondColor,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormField(
                                controller: email,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please enter your email';
                                  } else {
                                    return null;
                                  }
                                },
                                type: TextInputType.emailAddress,
                                hint: 'Email',
                                icon: Icon(Icons.email),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                controller: password,
                                isPassword: true,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please enter your password';
                                  } else {
                                    return null;
                                  }
                                },
                                type: TextInputType.emailAddress,
                                hint: 'Password',
                                icon: Icon(Icons.lock),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ConditionalBuilder(
                                condition: state is! AppLoginLoadingState,
                                fallback: (context) =>
                                    buildCircularProgressIndicator(),
                                builder: (context) => defaultButton(
                                  text: 'Login',
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      AppLoginCubit.get(context).userLogin(
                                        email: email.text,
                                        password: password.text,
                                      );
                                    }
                                  },
                                  btnColor: secondColor,
                                  txtColor: defaultColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Don\'t have account?'),
                              defaultButton(
                                text: 'Register',
                                onPressed: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                btnColor: secondColor,
                                txtColor: defaultColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
