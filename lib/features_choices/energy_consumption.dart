import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/features_choices/carbonfootprint_service.dart';
import 'package:mapbox_turn_by_turn/features_choices/footprint_result.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../widgetschoices/choices.dart' as choices;

class EnergyConsumptionForm extends StatefulWidget {
  final VoidCallback onNext;
  CarbonFootPrintCalculator carbonFootPrintCalculator =
      new CarbonFootPrintCalculator();

  EnergyConsumptionForm({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  _EnergyConsumptionFormState createState() => _EnergyConsumptionFormState();
}

class _EnergyConsumptionFormState extends State<EnergyConsumptionForm> {
  String? electricBill;
  String? gasBill;
  String? familyMembers;
  String? phoneConsumption;

  Color get primaryColor => Theme.of(context).primaryColor;

  List<String> _categoriesOption = [
    'Plastik Şişe',
    'Cam Şişe',
    'Teneke Kutu ',
    'Kağıt Bardak',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 7),
        electricBillOptions(),
        const Divider(indent: 20),
        naturalGasOptions(),
        const Divider(indent: 20),
        familyMembersOptions(),
        const Divider(indent: 20),
        phoneConsumptionOptions(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, minimumSize: Size(100, 50)),
            onPressed: isAllChoicesSelected() ? () => resultPage() : null,
            icon: Icon(
              Icons.calculate,
              color: Colors.white,
            ),
            label: Text("Hesapla"),
          ),
        )
      ],
    );
  }

  Widget electricBillOptions() {
    return SmartSelect<String?>.single(
      title: 'Aylık kac tl elektrik faturası ödüyorsunuz?',
      selectedValue: electricBill,
      choiceItems: choices.electricBill,
      onChange: (selected) => setState(() => electricBill = selected.value),
      modalType: S2ModalType.bottomSheet,
      modalHeaderBuilder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: state.modalTitle,
        );
      },
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/electric-bill.png',
            ),
          ),
        );
      },
    );
  }

  Widget naturalGasOptions() {
    return SmartSelect<String?>.single(
      title: 'Aylık kac tl dogal gaz faturası ödüyorsunuz?',
      selectedValue: gasBill,
      choiceItems: choices.electricBill,
      onChange: (selected) => setState(() => gasBill = selected.value),
      modalType: S2ModalType.bottomSheet,
      modalHeaderBuilder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: state.modalTitle,
        );
      },
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/gas.png',
            ),
          ),
        );
      },
    );
  }

  bool isAllChoicesSelected() {
    return this.electricBill != null &&
        this.gasBill != null &&
        this.familyMembers != null &&
        this.phoneConsumption != null;
  }

  Widget familyMembersOptions() {
    return SmartSelect<String?>.single(
      title: 'Ev ya da oda arkaşınız var mı ?',
      selectedValue: familyMembers,
      choiceItems: choices.frameworks,
      modalType: S2ModalType.popupDialog,
      onChange: (selected) {
        setState(() => familyMembers = selected.value);
      },
      tileBuilder: (context, state) {
        return ListTile(
          title: Text(state.title ?? ''),
          subtitle: Text(
            state.selected.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              '${state.selected!.value.toString()[0]}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: state.showModal,
        );
      },
    );
  }

  Widget phoneConsumptionOptions() {
    return SmartSelect<String?>.single(
      title: 'Günlük olarak telefonla kac saat geçiriyorsunuz ?',
      selectedValue: phoneConsumption,
      choiceItems: choices.plasticBootles,
      onChange: (selected) => setState(() => phoneConsumption = selected.value),
      modalType: S2ModalType.popupDialog,
      modalHeaderBuilder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: state.modalTitle,
        );
      },
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/charge.png',
            ),
          ),
        );
      },
    );
  }

  double calculateEnergyConsumption() {
    double electric = ((double.parse(electricBill!) / 30) /
            (double.parse(familyMembers!) + 1)) *
        703;
    double gas =
        ((double.parse(gasBill!) / 30) / (double.parse(familyMembers!) + 1)) *
            344;
    double phone = double.parse(phoneConsumption!) * 170;
    return electric + gas + phone;
  }

  setEnergyConsumption() {
    var test = calculateEnergyConsumption();
    this.widget.carbonFootPrintCalculator.setEnergy(test);
    var food = this.widget.carbonFootPrintCalculator.food;
    var accommodation = this.widget.carbonFootPrintCalculator.accommodation;
    var energy = this.widget.carbonFootPrintCalculator.energy;
    this.widget.onNext();
  }

  resultPage() {
    setEnergyConsumption();
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => FootPrintResultPage()));
  }
}
