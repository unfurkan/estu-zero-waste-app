import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mapbox_turn_by_turn/screens/panaroma.dart';
import 'package:mapbox_turn_by_turn/screens/testnav.dart';
import 'package:mapbox_turn_by_turn/widgets/endpoints_card.dart';
import 'package:mapbox_turn_by_turn/widgets/list_view.dart';

import '../widgets/review_ride_fa_button.dart';

class PrepareRide extends StatefulWidget {
  const PrepareRide({Key? key}) : super(key: key);

  @override
  State<PrepareRide> createState() => _PrepareRideState();

  // Declare a static function to reference setters from children
  static _PrepareRideState? of(BuildContext context) =>
      context.findAncestorStateOfType<_PrepareRideState>();
}

class _PrepareRideState extends State<PrepareRide> {
  bool isLoading = false;
  bool isEmptyResponse = true;
  bool hasResponded = false;
  bool isResponseForDestination = false;

  String noRequest = 'En yakın kutu için lütfen atık türünüzü belirtiniz';

  List responses = [];
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  // Define setters to be used by children widgets
  set responsesState(List responses) {
    setState(() {
      hasResponded = true;
    });
    Future.delayed(
      const Duration(milliseconds: 500),
      () => setState(() {
        isLoading = false;
      }),
    );
  }

  set isLoadingState(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  void setLoading(bool isResponseForDestination) {
    setState(() {
      this.isLoading = isResponseForDestination;
    });
  }

  void setResponded(bool hadResponded) {
    setState(() {
      this.hasResponded = hadResponded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeManagement())),
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Atık Kutuları')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                /* endpointsCard(sourceController, destinationController),*/
                isLoading
                    ? Column(children: [
                        SpinKitDoubleBounce(
                          size: 50,
                          color: Colors.indigoAccent,
                        ),
                        const SizedBox(height: 20),
                        Text("En yakın rota oluşturuluyor",
                            style: TextStyle(
                                color: Colors.indigoAccent, fontSize: 15)),
                      ])
                    : (Container(
                        child: Text(noRequest,
                            style: TextStyle(
                                color: Colors.indigoAccent, fontSize: 15)),
                      )),
                const SizedBox(height: 40),
                Closest(onLoading: setLoading, hadResponded: setResponded),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          hasResponded ? reviewRideFaButton(context) : Container(),
    );
  }
}
