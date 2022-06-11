import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../widgetschoices/features_header.dart';
import '../widgetschoices/keep_alive.dart';
import './food_consumption.dart';
import './choices_divider.dart';
import './accommodation_form.dart';
import './choices_theme.dart';

class FeaturesChoices extends StatelessWidget {
  final scrollController = ScrollController();
  final VoidCallback onNext;

  FeaturesChoices({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView(
        controller: scrollController,
        addAutomaticKeepAlives: true,
        children: <Widget>[
          KeepAliveWidget(
            child: StickyHeader(
              header: const FeaturesHeader('Ulaşım Aracı'),
              content: FeaturesChoicesBuilder(onNext: this.onNext,),
            ),
          ),
        ],
      ),
    );
  }
}
