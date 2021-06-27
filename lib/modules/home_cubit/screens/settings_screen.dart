import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/colors.dart';
import '../../../components/components.dart';
import '../../../modules/home_cubit/cubit/cubit.dart';
import '../../../modules/home_cubit/cubit/states.dart';
import '../../../modules/setting_screens/about_us_screen.dart';
import '../../../modules/setting_screens/language_screen.dart';
import '../../../modules/setting_screens/policy_screen.dart';
import '../../../modules/setting_screens/profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool getNotification = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: TextStyle(color: Colors.grey),
                ),
                buildSettingsItem(
                  onTap: () {
                    navigateTo(context, ProfileScreen());
                  },
                  text: 'Profile',
                  iconName: 'user',
                  widget: arrow_forward,
                ),
                myDivider(context),
                buildSettingsItem(
                  text: 'Notification',
                  iconName: 'notification',
                  widget: CupertinoSwitch(
                    value: getNotification,
                    onChanged: (val) {
                      setState(() => getNotification = val);
                    },
                    activeColor: secondColor.withOpacity(0.5),
                  ),
                ),
                myDivider(context),
                buildSettingsItem(
                  onTap: () {
                    navigateTo(context, LanguageScreen());
                  },
                  text: 'Language',
                  iconName: 'language',
                  widget: arrow_forward,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Others',
                  style: TextStyle(color: Colors.grey),
                ),
                buildSettingsItem(
                  onTap: () {
                    navigateTo(context, PolicyScreen());
                  },
                  text: 'Privacy Policy',
                  iconName: 'lock1',
                  widget: arrow_forward,
                ),
                myDivider(context),
                buildSettingsItem(
                  onTap: () {
                    navigateTo(context, AboutUsScreen());

                  },
                  text: 'About Us',
                  iconName: 'about_us',
                  widget: arrow_forward,
                ),
                myDivider(context),
                buildSettingsItem(
                  onTap: () {
                    Logout(context);
                  },
                  text: 'Logout',
                  iconName: 'logout',
                  widget: arrow_forward,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
