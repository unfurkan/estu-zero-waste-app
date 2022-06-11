import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_turn_by_turn/constants/restaurants.dart';
import 'package:mapbox_turn_by_turn/helpers/shared_prefs.dart';
import 'package:mapbox_turn_by_turn/screens/footprint.dart';
import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
import 'package:mapbox_turn_by_turn/screens/report.dart';
import 'package:mapbox_turn_by_turn/screens/review_ride.dart';

import '../features_choices/choices_main.dart';
import '../helpers/mapbox_handler.dart';
import '../main.dart';
import '../widgetschoices/carbon_foot_print.dart';
import 'panaroma.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng currentLocation = getCurrentLatLngFromSharedPrefs();
  late String currentAddress;
  bool plasticChecked = true;
  bool glassChecked = true;

  Map states = {
    'glass': true,
    'electronic': true,
    'batteries': true,
    'paper': true,
    'plastic': true,
    'organic': true,
    'metal': true,
    'bulb': true
  };

  late CameraPosition _initialCameraPosition;
  MapboxMapController? controller;

  @override
  void initState() {
    super.initState();

    _initialCameraPosition =
        CameraPosition(target: currentLocation, zoom: 15.5);
    currentAddress = getCurrentAddressFromSharedPrefs();
  }

  void _onMapCreated(MapboxMapController controller) {
    this.controller = controller;
    controller.onSymbolTapped.add(_onSymbolTapped);
  }

  @override
  void dispose() {
    controller?.onSymbolTapped.remove(_onSymbolTapped);
    super.dispose();
  }

  _showSnackBar(Map selectedSymbol) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 6),
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 400,
          child: Card(
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: SizedBox(
                    height: double.infinity,
                    child: CircleAvatar(
                        backgroundImage: AssetImage(selectedSymbol['image'])),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(selectedSymbol['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  subtitle: Column(
                    children: [
                      Text(selectedSymbol['description'],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton.icon(
                        style:
                        ElevatedButton.styleFrom(primary: Colors.redAccent),
                        onPressed: () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) =>
                                  ReportForm(
                                    locationString: selectedSymbol['name'],
                                    wasteType: selectedSymbol['typeDisplayName'],)));
                        },
                        icon: Icon(
                          Icons.report,
                          color: Colors.white,
                        ),
                        label: const Text('Rapor',
                            style: const TextStyle(color: Colors.white))),
                    const SizedBox(width: 4),
                    Visibility(
                      visible: isPanaromeExist(selectedSymbol),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.indigo),
                          onPressed:  () => navigatePanaroma(selectedSymbol),
                          icon: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                          label: Text("360\u00B0",
                              style: const TextStyle(color: Colors.white))),
                    ),
                    const SizedBox(width: 4),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.indigo),
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.directions,
                          color: Colors.white,
                        ),
                        label: const Text('Önizle',
                            style: const TextStyle(color: Colors.white))),
                  ],
                ),
              ],
            ),
          ),
        ),
        /* Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Text(
                    selectedSymbol['name'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Container(

                child: Text(selectedSymbol['description'],
                    style: const TextStyle(color: Colors.indigo)),
              ),
              const SizedBox(height: 20),

              Image.network(selectedSymbol['reel'], fit: BoxFit.fill),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                ElevatedButton(
                    onPressed: () => {
                      onPressed(),
                      ScaffoldMessenger.of(context).clearSnackBars()
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        padding: const EdgeInsets.all(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_walk,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Review Route',
                              style: const TextStyle(color: Colors.white)),
                        ])),
                  ElevatedButton(
                      onPressed: () => {
                        onPressed(),
                        ScaffoldMessenger.of(context).clearSnackBars()
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          padding: const EdgeInsets.all(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.directions_walk,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Review Route',
                                style: const TextStyle(color: Colors.white)),
                          ])),
                ]
              ),
            ]),*/
      ),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool isPanaromeExist(Map<dynamic, dynamic> selectedSymbol) => selectedSymbol['panaroma'] != null;

  void _onSymbolTapped(Symbol symbol) async {
    LatLng destination = new LatLng(
        symbol.options.geometry!.latitude, symbol.options.geometry!.longitude);
    var response = await getParsedReverseGeocoding(destination);
    sharedPreferences.setString('destination', json.encode(response));

    controller?.animateCamera(CameraUpdate.newCameraPosition(
        new CameraPosition(target: destination, zoom: 18)));

    Map selectedBin = restaurants
        .where((element) => symbol.data!['id'] == element['id'])
        .first;

    _showSnackBar(selectedBin);
  }

  void _onStyleLoaded() async {
    restaurants.forEach((element) async {
      addSymbol(element);
    });
  }

  Future<void> addSymbol(Map element) async {
    await controller!.addSymbol(
        SymbolOptions(
            geometry: LatLng(double.parse(element['coordinates']['latitude']),
                double.parse(element['coordinates']['longitude'])),
            iconImage: element['image'].toString(),
            iconSize: 0.6),
        {"type": element['type'], "id": element['id']});
  }

  void onPressed() async {
    ScaffoldMessenger.of(context).clearSnackBars();

    LatLng sourceLatLng = getTripLatLngFromSharedPrefs('source');
    LatLng destinationLatLng = getTripLatLngFromSharedPrefs('destination');
    Map modifiedResponse =
    await getDirectionsAPIResponse(sourceLatLng, destinationLatLng);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ReviewRide(modifiedResponse: modifiedResponse)));
  }

  void removeSymbols(String type) {
    var test = controller?.symbols
        .where((element) => element.data!['type'] == type)
        .toList();

    test?.forEach((element) {
      controller?.removeSymbol(element);
    });
  }

  void addSymbols(String type) {
    var filteredByType =
    restaurants.where((element) => element.containsValue(type)).toList();

    filteredByType.forEach((element) async {
      addSymbol(element);
    });
  }

  Widget buildSpecialAndroidSwitch(String type) =>
      Transform.scale(
        scale: 2,
        child: SizedBox(
          width: 75,
          child: Switch(
            // thumb colors
            activeTrackColor: Colors.blue.withOpacity(1.0),
            inactiveTrackColor: Colors.red.withOpacity(0.4),
            activeThumbImage: AssetImage('assets/icon/$type.png'),
            inactiveThumbImage: AssetImage('assets/icon/$type.png'),
            value: states[type],
            onChanged: (value) =>
                setState(() =>
                {
                  states[type] = value,
                  if (states[type])
                    {addSymbols(type)}
                  else
                    {removeSymbols(type)}
                }),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: MapboxMap(
                accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
                onMapCreated: _onMapCreated,
                onStyleLoadedCallback: _onStyleLoaded,
                styleString:
                'mapbox://styles/edxcoursesearcher/cl2ss1act004714s5c9ni8q8i',
                initialCameraPosition: _initialCameraPosition,
                myLocationEnabled: true,
                myLocationRenderMode: MyLocationRenderMode.NORMAL,
              ),
            ),
            Positioned(
              top: 150,
              left: 250,
              child: SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildSpecialAndroidSwitch("glass"),
                        buildSpecialAndroidSwitch("paper"),
                        buildSpecialAndroidSwitch("electronic"),
                        buildSpecialAndroidSwitch("plastic"),
                        buildSpecialAndroidSwitch("batteries"),
                        buildSpecialAndroidSwitch("organic"),
                        buildSpecialAndroidSwitch("metal"),
                      ]),
                ),
              ),
            ),
/*        Visibility(
          visible: false,
          child: Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Hi there!',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        const Text('You are currently here:'),
                        Text(currentAddress,
                            style: const TextStyle(color: Colors.indigo)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PrepareRide())),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(20)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Choose waste type'),
                                ])),
                      ]),
                ),
              ),
            ),
          ),
        ),*/
          ],
        ));
  }

  navigatePanaroma(Map selectedSymbol) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                Panaroma(asset: selectedSymbol['panaroma'],
                    description: selectedSymbol['name'])));
  }
}
