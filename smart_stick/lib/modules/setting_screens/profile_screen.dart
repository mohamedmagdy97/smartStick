import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/colors.dart';
import '../../components/components.dart';
import '../../components/constants.dart';
import '../../modules/home_cubit/cubit/cubit.dart';
import '../../modules/home_cubit/cubit/states.dart';
import '../../modules/home_cubit/home_layout.dart';
import 'package:toast/toast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppProfileUserUpdateSuccessState) {
            Toast.show('Data Updated Successful', context,
                duration: Duration(seconds: 3).inSeconds,
                backgroundColor: Colors.green);
            print('Done Update');
            navigateAndFinish(context, HomeLayout());
            setState(() => enabled = false);
          }
        },
        builder: (context, state) {
          nameController.text = name;
          emailController.text = email;
          passwordController.text = password;

          return Scaffold(
            appBar: AppBar(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              title: Text('Profile'),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() => enabled = !enabled);
                  },
                  icon: Icon(Icons.edit_outlined),
                )
              ],
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      height: 150,
                      width: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          defaultFormField1(
                            controller: nameController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter valid name';
                              } else {
                                return null;
                              }
                            },
                            type: TextInputType.text,
                            label: 'Name',
                            enabled: enabled,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          defaultFormField1(
                            controller: emailController,
                            validator: (val) {
                              if (val.isEmpty || !val.contains('@')) {
                                return 'Please enter valid email';
                              } else {
                                return null;
                              }
                            },
                            type: TextInputType.text,
                            label: 'Email',
                            enabled: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          defaultFormField1(
                            controller: passwordController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter valid password';
                              } else {
                                return null;
                              }
                            },
                            type: TextInputType.text,
                            label: 'Password',
                            isPassword: true,
                            enabled: false,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition:
                                state is! AppProfileUserUpdateLoadingState,
                            fallback: (context) =>
                                buildCircularProgressIndicator(),
                            builder: (context) => defaultButton(
                              text: 'Save',
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  AppCubit.get(context).updateUser(
                                    uname: nameController.text,
                                    uemail: emailController.text,
                                    upassword: passwordController.text,
                                  );
                                }
                              },
                              btnColor: secondColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
