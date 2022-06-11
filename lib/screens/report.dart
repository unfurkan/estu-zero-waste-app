import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mapbox_turn_by_turn/screens/home.dart';
import 'package:uiblock/uiblock.dart';

class ReportForm extends StatefulWidget {
  String locationString;
  String wasteType;

  ReportForm({Key? key, required this.wasteType, required this.locationString})
      : super(key: key);

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  var selectedReportType;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map> reportTypes = [
    {
      "id": '1',
      "image": 'assets/icon/wrong-location.png',
      "text": "Hatalı Konum"
    },
    {
      "id": '2',
      "image": 'assets/icon/useless.png',
      "text": "Kullanılamaz Kutu"
    },
    {
      "id": '3',
      "image": 'assets/icon/wrong-type.png',
      "text": "Atık Türü Eşleşmiyor"
    },
    {"id": '4', "image": 'assets/icon/other.png', "text": "Diğer"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rapor Formu")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 40, right: 40),
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(12),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Lütfen rapor formunu eksiksiz bir şekilde doldurunuz",
                      style:
                          TextStyle(color: Colors.indigoAccent, fontSize: 15)),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.contact_page), labelText: "Ad Soyad"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ad soyad girilmesi zorunludur";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.contact_mail), labelText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mail alanı girilmesi zorunludur";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, top: 50, bottom: 50),
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Expanded(
                                child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedReportType = newValue.toString();
                                    });
                                  },
                                  hint: Text("Rapor Türü Seçiniz"),
                                  value: selectedReportType,
                                  items: reportTypes
                                      .map((e) => DropdownMenuItem(
                                            value: e['id'].toString(),
                                            child: Row(
                                              children: [
                                                Image.asset(e['image'],
                                                    width: 25),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(e['text']),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 10,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        helperText: "Lütfen detaylı açıklama girin...",
                        labelText: "Açıklama",
                        icon: Icon(Icons.contact_support)),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigo),
                            onPressed: () {
                              submitReport(context);
                            },
                            icon: Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            label: const Text('Rapor Gönder',
                                style: const TextStyle(color: Colors.white))),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigo),
                            onPressed: () {
                              // default
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            label: const Text('İptal Et',
                                style: const TextStyle(color: Colors.white))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submitReport(BuildContext context) {
    if (!formKey.currentState!.validate() || selectedReportType == null) {
      return;
    }
    UIBlock.block(
      context,
      canDissmissOnBack: false,
      loadingTextWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Rapor Oluşturuluyor...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
    Future.delayed(Duration(seconds: 2)).then((value) => {
          UIBlock.unblock(context),
          _showSnackBar(),
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()))
        });
  }

  allSelected() {
    return this.selectedReportType != null;
  }

  _showSnackBar() {
    Map selected = this
        .reportTypes
        .where((element) => element.containsValue(this.selectedReportType))
        .first;

    final snackBar = SnackBar(
      duration: Duration(seconds: 4),
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 400,
          child: Card(
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: SizedBox(
                    height: double.infinity,
                    child: CircleAvatar(
                        backgroundImage: AssetImage("assets/image/shield.png")),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text("Rapor Oluşturma Başarılı",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  subtitle: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Text(this.widget.locationString,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text("Rapor Türü:",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text(selected['text'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                      Row(
                        children: [
                          Text("Kutu Türü:",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text(this.widget.wasteType,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
