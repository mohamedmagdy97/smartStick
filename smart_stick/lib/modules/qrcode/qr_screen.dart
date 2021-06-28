import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_stick/components/colors.dart';
import 'package:smart_stick/components/components.dart';
import 'package:smart_stick/modules/home_cubit/home_layout.dart';
import 'package:smart_stick/modules/login/cubit/cubit.dart';
import 'package:smart_stick/modules/login/cubit/states.dart';
import 'package:smart_stick/network/local/cache_helper.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key key}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String qrCode = '';

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#FF8447CD',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                leading: InkWell(
                  onTap: () {
                    Logout(context);
                  },
                  child: Image.asset('assets/icons/left-arrow.png'),
                ),
              ),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'QR Code of the device',
                      style: TextStyle(
                        color: secondColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        scanQRCode();
                      },
                      child: qrCode.isEmpty || qrCode == '-1'
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/barcode2.png',
                                ),
                                Center(
                                  child: Text(
                                    'Press',
                                    style: TextStyle(
                                        color: secondColor, fontSize: 22),
                                  ),
                                )
                              ],
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/qrcode.png',
                                ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    qrCode.isEmpty /*|| qrCode == '-1'*/
                        ? Text('')
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: defaultButton(
                              // alignment: Alignment.center,
                              text: 'Enter',
                              btnColor: secondColor,
                              txtColor: defaultColor,
                              onPressed: () {
                                CacheHelper.saveDate(
                                    key: 'qr_read', value: qrCode);
                                print('QR Read :' + qrCode);
                                AppLoginCubit.get(context)
                                    .updateUser(qrcode: qrCode);
                                navigateAndFinish(context, HomeLayout());
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
