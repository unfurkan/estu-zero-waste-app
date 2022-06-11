import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mapbox_turn_by_turn/screens/report.dart';
import 'package:mapbox_turn_by_turn/screens/testnav.dart';

import '../screens/home.dart';

class RateRide extends StatelessWidget {
  const RateRide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Rate your ride', style: Theme.of(context).textTheme.titleLarge),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
      ),
      ElevatedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const HomeManagement())),
          child: const Text('Ana Sayfaya Dön')),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const HomeManagement())),
              child: const Text('Rapor Oluştur'))
    ]));
  }
}
