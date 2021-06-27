import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_stick/components/colors.dart';
import 'package:smart_stick/components/components.dart';
import 'package:smart_stick/modules/qrcode/qr_screen.dart';

class PowerScreen extends StatefulWidget {
  const PowerScreen({Key key}) : super(key: key);

  @override
  _PowerScreenState createState() => _PowerScreenState();
}

class _PowerScreenState extends State<PowerScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
          onTap: () {},
          child: Image.asset('assets/icons/left-arrow.png'),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerRight,
          child: InkWell(
            child: Image.asset('assets/icons/right-arrow.png'),
            onTap: () {
              if (value) {
                navigateTo(context, QRScreen());
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Please switch on',
                    style: TextStyle(color: defaultColor),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: secondColor,
                ));
                print('please turn switch on');
              }
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/stick.png'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'power on the device & make sure the indicator is in purple color',
                  style: TextStyle(color: secondColor, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                CupertinoSwitch(
                  value: value,
                  trackColor: Colors.deepPurple[100].withOpacity(0.7),
                  onChanged: (val) {
                    setState(() => value = val);
                  },
                  activeColor: secondColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
