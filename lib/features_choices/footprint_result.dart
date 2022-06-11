import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/features_choices/carbonfootprint_service.dart';

class FootPrintResultPage extends StatefulWidget {
  CarbonFootPrintCalculator carbonFootPrintCalculator =
      CarbonFootPrintCalculator();

  FootPrintResultPage({Key? key}) : super(key: key);

  @override
  State<FootPrintResultPage> createState() => _FootPrintResultPageState();
}

class _FootPrintResultPageState extends State<FootPrintResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Icon(
            Icons.navigate_before,
            color: Colors.black54,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Harikaa ! ',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.black54,
                    ),
              ),
              Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/score.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                'Your Score: ',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: Colors.black54,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                this.widget.carbonFootPrintCalculator.getFinalResult().toStringAsFixed(2) +'g/CO₂ ',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.pink,
                    ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
