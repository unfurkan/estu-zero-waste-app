import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
 /*         onTap: ()(

          ),*/
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
              Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/score.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                'Your Score',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black54,
                ),
              ),
              Text('7540.12',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}