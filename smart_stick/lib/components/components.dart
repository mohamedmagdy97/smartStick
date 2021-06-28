import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/colors.dart';
import '../../components/constants.dart';
import '../../modules/login/login_screen.dart';
import '../../network/local/cache_helper.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required FormFieldValidator<String> validator,
   VoidCallback onTap,
  @required TextInputType type,
   ValueChanged<String> onSubmit,
   ValueChanged<String> onChange,
  @required String hint,
  @required var icon,
  bool enabled = true,
  bool isPassword = false,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: icon,
        contentPadding: EdgeInsets.fromLTRB(15, 6, 15, 6),
        enabled: enabled,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

Widget defaultFormField1({
  @required TextEditingController controller,
  @required FormFieldValidator<String> validator,
   VoidCallback onTap,
  @required TextInputType type,
   ValueChanged<String> onSubmit,
   ValueChanged<String> onChange,
  @required String label,
  bool enabled = true,
  bool isPassword = false,
}) =>
    TextFormField(

      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16, 5, 16, 5),
        enabled: enabled,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
      ),
    );

Widget defaultButton({
  @required String text,
  @required VoidCallback onPressed,
  @required Color btnColor,
  Color txtColor = Colors.white,
  bool isUpperCase = true,
  double radius = 10,
}) {
  return Container(
    width: double.infinity,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
    ),
    child: MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: btnColor,
      textColor: txtColor,
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

Widget myDivider(context) {
  return Divider(
    color: secondColor.withOpacity(0.15),
    thickness: 1,
  );
}

Widget buildCircularProgressIndicator() => Center(
      child: CircularProgressIndicator(),
    );

void Logout(BuildContext context) {
  FirebaseAuth.instance.signOut();
  CacheHelper.removeData(key: 'uid');
  uid = null;
  navigateAndFinish(context, LoginScreen());

  // CacheHelper.removeData(key: 'qr_read');
}

Widget defaultDrawerItem({
  @required String text,
  @required GestureTapCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: secondColor, fontSize: 20),
        ),
      ],
    ),
  );
}

Widget defaultDrawerItem1({
  var image,
  @required String text,
  @required GestureTapCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Image(image: image),
        // Image.asset(
        //   'assets/icons/$image',
        //   height: 50,
        //   width: 50,
        //   color: secondColor,
        // ),
        Text(
          text,
          style: TextStyle(color: secondColor, fontSize: 20),
        ),
        image,
      ],
    ),
  );
}


Widget arrow_forward = Icon(
  Icons.arrow_forward_ios,
  color: secondColor,
  size: 18,
);

Widget buildSettingsItem({
  Function onTap,
  String iconName,
  String text,
  Widget widget,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Image.asset(
          'assets/icons/$iconName.png',
          width: 25,
          height: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(color: secondColor, fontSize: 20),
        ),
        Spacer(),
        widget,
      ],
    ),
  );
}


BottomNavigationBarItem buildBottomNavigationBarItem({@required String icon,@required String activeIcon,@required String text,}) {
  return BottomNavigationBarItem(
    icon: Image.asset('assets/icons/$icon.png'),
    activeIcon: Image.asset('assets/icons/$activeIcon.png'),
    label: text,
  );
}


Container buildOldNotification(BuildContext context, {Function onTap}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8),
    width: double.infinity,
    child: InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/icons/alert1.png'),
            Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Device send you a kick its in danger .',
                  style:
                  TextStyle(color: Colors.grey, fontSize: 18),
                )),
            Column(
              children: [
                Text(
                  '03:25',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Container buildNewNotification(BuildContext context, {Function onTap}) {
  return Container(
    width: double.infinity,
    child: InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/icons/alert.png'),
            Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Device send you a kick its in danger . click to see',
                  style:
                  TextStyle(color: secondColor, fontSize: 18),
                )),
            Column(
              children: [
                Text(
                  '03:25',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.info,
                  color: secondColor,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


AppBar buildAppBar({String title}) {
  return AppBar(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    title: Text(title),
    centerTitle: true,
  );
}
