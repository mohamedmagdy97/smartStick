import '../../components/colors.dart';
import '../../components/components.dart';
import '../../components/constants.dart';
import '../../modules/home_cubit/home_layout.dart';
import '../../modules/login/cubit/cubit.dart';
import '../../modules/login/cubit/states.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/login/login_screen.dart';
import '../../modules/setting_screens/policy_screen.dart';
import '../../network/local/cache_helper.dart';
import 'package:toast/toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppLoginCubit>(
      create: (context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          if (state is AppCreateUserSuccessState) {
            CacheHelper.saveDate(key: 'uid', value: state.uid);
            uid = state.uid;
            navigateAndFinish(context, HomeLayout());
          } else if (state is AppRegisterErrorState) {
            Toast.show('${state.error}', context,
                duration: Toast.LENGTH_LONG,
                backgroundColor: Colors.red,
                textColor: defaultColor);
          }
        },
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                        'REGISTER',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                  controller: fullName,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please Enter valid name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  type: TextInputType.name,
                                  hint: 'Full Name',
                                  icon: Icon(Icons.text_snippet_outlined),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: email,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please Enter valid Email';
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
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please Enter valid Password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  type: TextInputType.text,
                                  isPassword: true,
                                  hint: 'Password',
                                  icon: Icon(Icons.lock),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: checked,
                            onChanged: (val) {
                              setState(() => checked = val);
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .8,
                            child: InkWell(
                              onTap: () {
                                navigateTo(context, PolicyScreen());
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text: 'I accept the ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'privacy policy ',
                                      style: TextStyle(
                                        color: secondColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'and reach ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'your location',
                                      style: TextStyle(
                                        color: secondColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConditionalBuilder(
                              condition: state is! AppRegisterLoadingState,
                              fallback: (context) =>
                                  buildCircularProgressIndicator(),
                              builder: (context) => defaultButton(
                                text: 'Register',
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    if (checked) {
                                      AppLoginCubit.get(context).userRegister(
                                        name: fullName.text,
                                        email: email.text,
                                        password: password.text,
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Can\'t create new account without accept our privacy policy !',
                                            style:
                                                TextStyle(color: defaultColor),
                                          ),
                                          duration: Duration(seconds: 3),
                                          // backgroundColor: secondColor,
                                        ),
                                      );
                                    }
                                  }
                                },
                                btnColor: secondColor,
                                txtColor: defaultColor,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text('Have an account?'),
                            defaultButton(
                              text: 'Login',
                              onPressed: () {
                                navigateAndFinish(context, LoginScreen());
                              },
                              btnColor: secondColor,
                              txtColor: defaultColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
