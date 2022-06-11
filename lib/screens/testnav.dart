import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/screens/home.dart';
import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
import 'package:mapbox_turn_by_turn/widgets/list_view.dart';

import '../views/home_view.dart';
import '../widgetschoices/carbon_foot_print.dart';

class HomeManagement extends StatefulWidget {
  const HomeManagement({Key? key}) : super(key: key);

  @override
  State<HomeManagement> createState() => _HomeManagementState();
}

class _HomeManagementState extends State<HomeManagement> {
  final List<Widget> _pages = [
    const Home(),
    PrepareRide(),
    HomeView(),
    CarbonFootPrint()
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex) {
          setState(() {
            _index = selectedIndex;
          });
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.map), label: 'Atık Kutuları'),
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me), label: 'Yönlendirici'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Portal'),
          BottomNavigationBarItem(icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/image/carbo-tab-2.png"),
          ), label: 'C02 Ayak İzi'),
        ],
      ),
    );
  }
}
