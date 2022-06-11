import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WasteTypeFilter extends StatefulWidget {
  final String wasteType;

  const WasteTypeFilter({Key? key, required this.wasteType}) : super(key: key);

  @override
  State<WasteTypeFilter> createState() => _WasteTypeFilterState();
}

class _WasteTypeFilterState extends State<WasteTypeFilter> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        onPressed: () => {print("waste type" + widget.wasteType)},
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(widget.wasteType),
        ]));
  }
}
