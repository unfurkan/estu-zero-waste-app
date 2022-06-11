import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgetschoices/choices.dart' as choices;

class FootPrintForm extends StatefulWidget {
  const FootPrintForm({Key? key}) : super(key: key);

  @override
  State<FootPrintForm> createState() => _FootPrintFormState();
}

class _FootPrintFormState extends State<FootPrintForm> {

  int? _commute;

  List<String> _user = [];
  List<S2Choice<String>> _users = [];
  bool _usersIsLoading = false;

  ThemeData get theme => Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            const SizedBox(height: 7),
            SmartSelect<int?>.single(
              title: 'Transportation',
              placeholder: 'Choose one',
              selectedValue: _commute,
              onChange: (selected) => setState(() => _commute = selected.value),
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
                              backgroundImage: NetworkImage(choice.meta['image']),
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
                    'https://source.unsplash.com/3k5cAmxjXl4/100x100';
                return S2Tile.fromState(
                  state,
                  isTwoLine: true,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(avatar),
                  ),
                );
              },
            ),
            const Divider(indent: 20),
            const SizedBox(height: 7),
          ],
      );

  }


}
