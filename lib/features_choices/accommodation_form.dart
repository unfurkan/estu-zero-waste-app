import 'dart:ffi';

import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mapbox_turn_by_turn/features_choices/carbonfootprint_service.dart';
import 'package:mapbox_turn_by_turn/screens/score_page.dart';
import '../widgetschoices/choices.dart' as choices;
import '../widgetschoices/icon_badge.dart';

class FeaturesChoicesBuilder extends StatefulWidget {
  final VoidCallback onNext;
  CarbonFootPrintCalculator carbonFootPrintCalculator = new CarbonFootPrintCalculator();

  FeaturesChoicesBuilder({Key? key, required this.onNext}) : super(key: key);

  @override
  _FeaturesChoicesBuilderState createState() => _FeaturesChoicesBuilderState();
}

class _FeaturesChoicesBuilderState extends State<FeaturesChoicesBuilder> {
  int? transportationType;
  String? fuelType;
  String? distance;

  int totalResult = 0;

  ThemeData get theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 7),
        transportationTypeSelections(),
        const Divider(indent: 20),
        (transportationType == 1) ? fuelTypeSelection() : Container(),
        const Divider(indent: 20),
        (transportationType == 3 || transportationType == 4)
            ? Container()
            : distanceSelection(),
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, minimumSize: Size(100, 50)),
            onPressed: isAllChoicesSelected() ? () => setAccommodation() : null,
            icon: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
            label: Text("Sonraki"),
          ),
        ),
      ],
    );
  }

  bool isAllChoicesSelected() {
    bool distancePredicate = distance != null;
    bool transportationTypePredicate = transportationType != null;
    bool fuelTypePredicate = fuelType != null;

    bool finalPredicate =transportationTypePredicate;

    if (transportationType == 0 ||
        transportationType == 1 ||
        transportationType == 2) {
      finalPredicate = finalPredicate && distancePredicate;

      if (transportationType == 1) {
        finalPredicate = finalPredicate && fuelTypePredicate;
      }
    }

    return finalPredicate;
  }

  @override
  initState() {
    super.initState();
  }

  Widget transportationTypeSelections() {
    return SmartSelect<int?>.single(
      title: 'Ulaşım Şekli',
      placeholder: 'Lütfen ulaşım aracı seçin',
      selectedValue: transportationType,
      onChange: (selected) =>
          setState(() => transportationType = selected.value),
      modalType: S2ModalType.bottomSheet,
      modalHeader: false,
      choiceItems: S2Choice.listFrom<int, Map<String, String>>(
        source: choices.transports,
        value: (index, item) => index,
        title: (index, item) => item['title'] ?? '',
        subtitle: (index, item) => item['subtitle'] ?? '',
        meta: (index, item) => item,
      ),
      choiceLayout: S2ChoiceLayout.wrap,
      choiceDirection: Axis.horizontal,
      choiceBuilder: (context, state, choice) {
        return Card(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          color: choice.selected ? theme.primaryColor : theme.cardColor,
          child: InkWell(
            onTap: () => choice.select?.call(true),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(choice.meta['image']),
                      child: choice.selected
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      choice.title ?? '',
                      style: TextStyle(
                        color: choice.selected ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      tileBuilder: (context, state) {
        String avatar = (state.selected?.choice?.meta ?? {})['image'] ??
            'assets/image/bus.png';
        return S2Tile.fromState(
          state,
          isTwoLine: true,
          leading: CircleAvatar(
            backgroundImage: AssetImage(avatar),
          ),
        );
      },
    );
  }

  Widget fuelTypeSelection() {
    return SmartSelect<String?>.single(
      title: 'Yakıt Türü',
      placeholder: "Yakıt Türü",
      selectedValue: fuelType,
      choiceItems: choices.vehicleType,
      onChange: (selected) => setState(() => fuelType = selected.value),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/fuel-type.png',
            ),
          ),
        );
      },
    );
  }

  Widget distanceSelection() {
    return SmartSelect<String?>.single(
      title: 'Kampüse kac km uzaklıktasınız ?',
      placeholder: 'Uzaklık',
      selectedValue: distance,
      choiceItems: choices.distance,
      onChange: (selected) => setState(() => distance = selected.value),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (context, state) {
        return S2Tile.fromState(state,
            leading: const CircleAvatar(
                backgroundImage: AssetImage(
              'assets/image/distance-km.png',
            )));
      },
    );
  }

  double calculateFootPrint() {
    if (transportationType == 0) {
      return double.parse(distance!) * 19.93;
    } else if (transportationType == 1) {
      return double.parse(distance!) * double.parse(fuelType!);
    }
    if (transportationType == 2) {
      return double.parse(distance!) * 67.2;
    }
    return 0;
  }

  setAccommodation() {
    var test = calculateFootPrint();
    this.widget.carbonFootPrintCalculator.setAccommodation(test);
    print(this.widget.carbonFootPrintCalculator.accommodation);
    this.widget.onNext();
  }
}

class ActionButton extends StatelessWidget {
  final Widget label;
  final VoidCallback onTap;

  ActionButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: label,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: onTap,
    );
  }
}
