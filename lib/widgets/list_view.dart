import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../helpers/mapbox_handler.dart';
import '../helpers/shared_prefs.dart';
import '../main.dart';

import '../constants/restaurants.dart';
import '../screens/prepare_ride.dart';

class Closest extends StatefulWidget {
  ValueChanged<bool> onLoading;
  ValueChanged<bool> hadResponded;

  Closest({Key? key, required this.onLoading, required this.hadResponded})
      : super(key: key);

  @override
  State<Closest> createState() => _ClosestState();
}

class _ClosestState extends State<Closest> {
  List<Map> responses = [
    {
      'type': 'plastic',
      'title': 'Plastik',
      'subTitle':
          'Su, meşrubat, sıvı yağ ambalajları, deterjan kapları gibi malzemeler',
      'image': 'assets/icon/plastic.png',
      'selected': false
    },
    {
      'type': 'electronic',
      'title': 'Elektronik',
      'subTitle': 'Elektronik atıklar mouse,kulaklık vb.',
      'image': 'assets/icon/electronic.png',
      'selected': false
    },
    {
      'type': 'glass',
      'title': 'Cam Şişe',
      'subTitle': 'Cam şişe, kavanozlar, bardak gibi cam malzemeler',
      'image': 'assets/icon/glass.png',
      'selected': false
    },
    {
      'type': 'organic',
      'title': 'Organik',
      'subTitle':
          'Yemekhanelerden çıkan yemek hazırlama atıkları, meyve atıkları, çay ve kahve posası atıkları, park ve bahçelerden gelen bahçe atıkları organik içerikli atıklardır.',
      'image': 'assets/icon/organic.png',
      'selected': false
    },
    {
      'type': 'batteries',
      'title': 'Pil Atık Kutusu',
      'subTitle': 'Nikel kadmiyum, nikel metalhidrit ve lityum iyon piller ',
      'image': 'assets/icon/batteries.png',
      'selected': false
    },
    {
      'type': 'paper',
      'title': 'Kağıt',
      'subTitle':
          'Kağıt- karton ambalajları, dergi, kitap, yazı ve çizim kağıdı gibi malzemeler ',
      'image': 'assets/icon/paper.png',
      'selected': false
    }
  ];

  LatLng getLatLng(Map map) {
    return LatLng(double.parse(map['coordinates']['latitude']),
        double.parse(map['coordinates']['longitude']));
  }

  Future<LatLng> filterByType(String type) async {
    var filteredByType =
        restaurants.where((element) => element.containsValue(type)).toList();

    LatLng closest = new LatLng(0.0, 0.0);
    double duration = double.infinity;
    LatLng sourceLatLng = getCurrentLatLngFromSharedPrefs();

    for (int i = 0; i < filteredByType.length; i++) {
      LatLng destination = getLatLng(filteredByType[i]);
      Map modifiedResponse =
          await getDirectionsAPIResponse(sourceLatLng, destination);

      if (modifiedResponse['duration'] <= duration) {
        duration = modifiedResponse['duration'];
        closest = destination;
      }
    }
    return closest;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: responses.length,
      itemBuilder: (BuildContext context, int index) {
        String icon = responses[index]['image'];
        return Column(
          children: [
            ListTile(
              selected: responses[index]['selected'],
              selectedTileColor: Colors.indigo.shade200,
              onTap: () async {
                String type = responses[index]['type'];

                setState(() {
                  responses
                      .where((element) => element['selected'])
                      .forEach((element) {
                    element['selected'] = false;
                  });
                  responses[index]['selected'] = !responses[index]['selected'];
                });

                LatLng sourceLatLng = getCurrentLatLngFromSharedPrefs();
                LatLng closest = await filterByType(type);
                widget.onLoading(true);
                widget.hadResponded(false);

                var response = await getParsedReverseGeocoding(closest);
                sharedPreferences.setString(
                    'destination', json.encode(response));

                Future.delayed(Duration(seconds: 1))
                    .then((value) =>{
                  widget.onLoading(false),
                  widget.hadResponded(true)
                } );

                FocusManager.instance.primaryFocus?.unfocus();
              },
              leading: SizedBox(
                height: double.infinity,
                child: CircleAvatar(
                    backgroundImage: AssetImage(responses[index]['image'])),
              ),
              title: Text(responses[index]['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(responses[index]['subTitle'],
                  overflow: TextOverflow.ellipsis),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
