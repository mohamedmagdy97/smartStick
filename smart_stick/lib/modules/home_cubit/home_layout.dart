import '../../components/colors.dart';
import '../../components/components.dart';
import '../../modules/home_cubit/cubit/cubit.dart';
import '../../modules/home_cubit/cubit/states.dart';
import '../../modules/setting_screens/about_us_screen.dart';
import '../../modules/setting_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: Image.asset('assets/icons/menu.png'),
                    tooltip: 'Drawer',
                  ),
                ),
              ],
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Logout(context);
                  },
                  icon: Image.asset('assets/icons/left-arrow.png'),
                  tooltip: 'Exit',
                ),
              ),
              centerTitle: true,
              backgroundColor: defaultColor,
              title: Text(cubit.title[cubit.currentIndex]),
            ),
            endDrawer: Container(
              alignment: Alignment.topRight,
              transformAlignment: AlignmentDirectional.topEnd,
              height: MediaQuery.of(context).size.height * 0.5,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Drawer(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultDrawerItem(
                                text: 'Profile',
                                onTap: () {
                                  navigateTo(context, ProfileScreen());
                                }),
                            defaultDrawerItem(
                                text: 'About us',
                                onTap: () {
                                  navigateTo(context, AboutUsScreen());
                                }),
                            myDivider(context),
                            defaultDrawerItem1(
                              text: 'Logout',
                              onTap: () {
                                Logout(context);
                              },
                              image: Image.asset('assets/icons/exit.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                buildBottomNavigationBarItem(
                    icon: 'setting', activeIcon: 'setting1', text: ''),
                buildBottomNavigationBarItem(
                    icon: 'location1', activeIcon: 'location', text: ''),
                buildBottomNavigationBarItem(
                    icon: 'home', activeIcon: 'home1', text: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
