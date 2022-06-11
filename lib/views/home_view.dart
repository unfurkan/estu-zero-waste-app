import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/views/popular_tab_view.dart';
import 'package:mapbox_turn_by_turn/views/recent_tab_view.dart';
import 'package:mapbox_turn_by_turn/views/trending_tab_view.dart';

import '../constants/constants.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    labelColor: Colors.indigo,
                    unselectedLabelColor: kGrey1,
                    unselectedLabelStyle: kNonActiveTabStyle,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    labelStyle: kActiveTabStyle.copyWith(fontSize: 25.0),
                    tabs: [
                      Tab(text: "En Yeni"),
                      Tab(text: "Sıfır Atık"),
                      Tab(text: "Eco Campus"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularTabView(),
            TrendingTabView(),
            RecentTabView(),
          ],
        ),
      ),
    );
  }
}
