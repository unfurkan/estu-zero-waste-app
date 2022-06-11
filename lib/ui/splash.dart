import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_turn_by_turn/screens/testnav.dart';

import '../helpers/mapbox_handler.dart';
import '../main.dart';
import '../screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();
  }

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }

    // Get the current user location
/*
    LocationData _locationData = await _location.getLocation();
*/

    LatLng currentLocation = LatLng(39.814813, 30.532171);

    // Get the current user address
    Map currentLocationMap = await getParsedReverseGeocoding(currentLocation);

    // Store the user location in sharedPreferences
    sharedPreferences.setDouble('latitude', 39.814813);
    sharedPreferences.setDouble('longitude', 30.532171);
    sharedPreferences.setString('current-address', currentLocationMap['place']);
    sharedPreferences.setString('source', json.encode(currentLocationMap));
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeManagement()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Image(
                image: AssetImage('assets/image/logo3.png'),
                height: 200,
                width: 300),
          ),
          const SizedBox(height: 30),
          Text(
            'ESTU Zero Waste',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
