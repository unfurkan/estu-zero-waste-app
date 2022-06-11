import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/features_choices/carbonfootprint_service.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../widgetschoices/choices.dart' as choices;

class FootConsumptionForm extends StatefulWidget {
  final VoidCallback onNext;

  CarbonFootPrintCalculator carbonFootPrintCalculator =
      CarbonFootPrintCalculator();

  FootConsumptionForm({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  _FootConsumptionFormState createState() => _FootConsumptionFormState();
}

class _FootConsumptionFormState extends State<FootConsumptionForm> {
  String? plasticBootle;
  List<int> recycle = [];
  String? glassBottle;
  String? alBootle;
  String? cartoonGlass;
  String? fastFood;
  String? modal;

  Color get primaryColor => Theme.of(context).primaryColor;

  List<String> _categoriesOption = [
    'Plastik Şişe',
    'Cam Şişe',
    'Teneke Kutu ',
    'Kağıt Bardak',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 7),
            plasticBottleSelection(),
            const Divider(indent: 20),
            alBootleSelection(),
            const Divider(indent: 20),
            cartoonGlassSelection(),
            const Divider(indent: 20),
            fastFoodSelections(),
            const Divider(indent: 20),
            glassBottleSelection(),
            const Divider(indent: 20),
            recycle2(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent, minimumSize: Size(100, 50)),
                onPressed:
                    isAllChoicesSelected() ? () => setFoodConsumption() : null,
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                label: Text("Sonraki"),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, minimumSize: Size(100, 50)),
              onPressed: () {

              },
              icon: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              label: Text("Önceki"),
            )
          ],
        ),
      ],
    );
  }

  Widget previousModal() {
    return SmartSelect<String?>.single(
      title: 'Bir önceki sayfaya giderseniz yaptıgınız değişiklikler kaybolacaktır.Onaylıyor musuz ?',
      selectedValue: modal,
      choiceItems: choices.modalOptions,
      onChange: (selected) => setState(() => modal = selected.value),
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

  bool isAllChoicesSelected() {
    return this.plasticBootle != null &&
        this.glassBottle != null &&
        this.cartoonGlass != null &&
        this.alBootle != null;
  }

  Widget plasticBottleSelection() {
    return SmartSelect<String?>.single(
      title: 'Günlük ortalama kaç adet pet şişede satılan su alıyorsunuz?',
      selectedValue: plasticBootle,
      choiceItems: choices.plasticBootles,
      onChange: (selected) => setState(() => plasticBootle = selected.value),
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
              'assets/image/plastic-bootle.png',
            ),
          ),
        );
      },
    );
  }

  Widget recycle2() {
    return SmartSelect<int>.multiple(
      title: 'Bu atıklardan hangilerini geri dönüşüm kutusuna atıyorsunuz ?',
      selectedValue: recycle,
      onChange: (selected) {
        setState(() => recycle = selected!.value!);
      },
      choiceItems: S2Choice.listFrom<int, String>(
        source: _categoriesOption,
        value: (index, item) => index,
        title: (index, item) => item,
      ),
      choiceType: S2ChoiceType.switches,
      modalType: S2ModalType.popupDialog,
      modalHeader: false,
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/recycle.png',
            ),
          ),
          isTwoLine: true,
        );
      },
    );
  }

  Widget glassBottleSelection() {
    return SmartSelect<String?>.single(
      title:
          'Günlük ortalama kaç adet cam şişelerde satılan meşrubatlardan tüketiyorsunuz?',
      selectedValue: glassBottle,
      choiceItems: choices.plasticBootles,
      onChange: (selected) => setState(() => glassBottle = selected.value),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/glass-bootle.png',
            ),
          ),
        );
      },
    );
  }

  Widget cartoonGlassSelection() {
    return SmartSelect<String?>.single(
      title:
          'Günde kaç defa karton bardakta satılan ürünlerden alıyorsunuz? (Çay, kahve, bitki çayı)',
      selectedValue: cartoonGlass,
      choiceItems: choices.plasticBootles,
      onChange: (selected) => setState(() => cartoonGlass = selected.value),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/cartoon-glass.png',
            ),
          ),
        );
      },
    );
  }

  Widget fastFoodSelections() {
    return SmartSelect<String?>.single(
      title:
          'Günde kaç adet ambalajlı yiyecek tüketiyorsunuz? (Kek, çikolata, kraker vb.)',
      selectedValue: fastFood,
      choiceItems: choices.plasticBootles,
      onChange: (selected) => setState(() => fastFood = selected.value),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/pocket.png',
            ),
          ),
        );
      },
    );
  }

  Widget alBootleSelection() {
    return SmartSelect<String?>.single(
      title:
          'Günlük ortalama kaç adet teneke kutularda satılan meşrubatlardan tüketiyorsunuz?',
      selectedValue: alBootle,
      choiceItems: choices.alBootles,
      onChange: (selected) => setState(() => alBootle = selected.value),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/image/al-bottle.png',
            ),
          ),
        );
      },
    );
  }

  double calculateFoodConsumption() {
    double plastic = double.parse(plasticBootle!) *
        (32 - recycle.firstWhere((element) => element == 0, orElse: () => 0));
    double glass = double.parse(glassBottle!) *
        (32 - recycle.firstWhere((element) => element == 1, orElse: () => 0));
    double al = double.parse(alBootle!) *
        (170 - recycle.firstWhere((element) => element == 2, orElse: () => 0));
    double cartoon = double.parse(cartoonGlass!) *
        (32 - recycle.firstWhere((element) => element == 3, orElse: () => 0));

    return plastic + glass + al + cartoon;
  }

  setFoodConsumption() {
    var test = calculateFoodConsumption();
    this.widget.carbonFootPrintCalculator.setFood(test);
    this.widget.onNext();
  }
}
