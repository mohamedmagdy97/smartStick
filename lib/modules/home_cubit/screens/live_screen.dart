import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../components/colors.dart';
import '../../../components/components.dart';
import '../../../components/constants.dart';
import '../../../modules/home_cubit/cubit/cubit.dart';
import '../../../modules/home_cubit/cubit/states.dart';

class LiveScreen extends StatefulWidget {
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  GoogleMapController _googleMapController;

  double lat;
  double long;

  @override
  void initState() {
    getCurrentLocation();
    _addMarker(LatLng(latitude, longitude));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppGetUserLoadingState) {
            buildCircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return (lat == null || long == null)
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  body: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(lat, long),
                          zoom: 11.5,
                        ),
                        onMapCreated: (controller) =>
                            _googleMapController = controller,
                        markers: {
                          Marker(
                            markerId: MarkerId('myLocation'),
                            infoWindow: InfoWindow(title: 'My Location'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed,
                            ),
                            position: LatLng(lat, long),
                          ),
                          Marker(
                            markerId: MarkerId('Destination'),
                            infoWindow: InfoWindow(title: 'Destination'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueViolet),
                            position: LatLng(latitude, longitude),
                          ),
                        },
                        compassEnabled: true,
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        myLocationEnabled: true,
                        // onLongPress: _addMarker2,
                      ),
                    ],
                  ),
                  floatingActionButton: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: secondColor,
                        onPressed: () async {
                          _googleMapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(latitude, longitude),
                                zoom: 14.5,
                                tilt: 50,
                              ),
                            ),
                          );

                          AppCubit.get(context).getUserData();
                        },
                        child: Icon(
                          Icons.hail,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FloatingActionButton(
                        heroTag: "btn2",
                        onPressed: () => _googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(lat, long),
                              zoom: 14.5,
                              tilt: 50,
                            ),
                          ),
                        ),
                        backgroundColor: Colors.red,
                        child: Icon(Icons.location_on),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    Marker(
      markerId: MarkerId('Destination'),
      infoWindow: InfoWindow(title: 'Destination'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: pos,
    );
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('${position.latitude} , ${position.longitude}');
    var lastPosition = await Geolocator.getLastKnownPosition();
    print('Last Position :  ${lastPosition}');

    setState(() {
      lat = lastPosition.latitude;
      long = lastPosition.longitude;
    });
  }
}
