import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/features_choices/energy_consumption.dart';
import 'package:mapbox_turn_by_turn/widgets/read_only_tab_bar.dart';

import '../features_choices/food_consumption.dart';
import '../features_choices/choices_main.dart';
import 'features_brightness.dart';
import 'features_color.dart';
// import 'features_theme.dart';
import 'keep_alive.dart';

class CarbonFootPrint extends StatefulWidget {
  const CarbonFootPrint({Key? key}) : super(key: key);

  @override
  State<CarbonFootPrint> createState() => _CarbonFootPrintState();
}

class _CarbonFootPrintState extends State<CarbonFootPrint> with SingleTickerProviderStateMixin {

  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Karbon Ayak İzi Hesapla'),
          bottom: ReadOnlyTabBar(
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: 'Ulaşım',icon: Icon(Icons.directions_bus)),
                Tab(text: 'Gıda Tüketimi',icon: Icon(Icons.food_bank)),
                Tab(text: 'Enerji Tüketimi',icon: Icon(Icons.bolt)),
              ],
            ),
          ),
          actions: <Widget>[
/*            FeaturesBrightness(),
            FeaturesColor(),*/
            IconButton(
              icon: Icon(Icons.help_outline),
              onPressed: () => _about(context),
            )
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            KeepAliveWidget(
              child: FeaturesChoices(onNext: (){
                _tabController.index=1;
              }),
            ),
            KeepAliveWidget(
              child: FootConsumptionForm(onNext: (){
                _tabController.index=2;
                },),
            ),
            KeepAliveWidget(
              child: EnergyConsumptionForm(onNext: (){_tabController.index=2;},),
            ),
          ],
        ),
        // bottomNavigationBar: Card(
        //   elevation: 3,
        //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        //   child: FeaturesTheme(),
        // ),
      ),
    );
  }

  void _about(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                'Karbon Ayak İzi',
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text('Nasıl Hesaplanır'),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
'Karbon hesaplamanıza adımları takip ederek yapabilirsiniz, tüm alanlar zorunludur.CO üretimine neden olduğunuzu hesaplayabilir, toplam tCO₂ üretimizini hesapladıktan sonra bunu telafi etmek için öneriler alabilirsiniz.',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Container(height: 15),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}


