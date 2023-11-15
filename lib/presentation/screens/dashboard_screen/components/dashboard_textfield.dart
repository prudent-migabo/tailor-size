import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/utils/utils.dart';

class DashboardTextField extends StatefulWidget {
  const DashboardTextField({Key? key}) : super(key: key);

  @override
  State<DashboardTextField> createState() => _DashboardTextFieldState();
}

class _DashboardTextFieldState extends State<DashboardTextField> {
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();
  }

  void init() async {
    var p = await ClientRepository().listClientsNames();
    print('000000000000000 $p');
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var state = context.select((ClientCubit cubit) => cubit.state.clients);
        for (var sug in state) {
          suggestions.add(sug.fullName!);
          print('000000000000000 $suggestions');
        }
        return Card(
          clipBehavior: Clip.hardEdge,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            height: 40,

            child: RawAutocomplete(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                } else {
                  List<String> matches = <String>[];
                  matches.addAll(suggestions);

                  matches.retainWhere((s) {
                    return s
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                  return matches;
                }
              },
              onSelected: (String selection) {
                print('You just selected $selection');
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: dashboardFieldDecor(),
                  controller: textEditingController,
                  focusNode: focusNode,
                );
              },
              optionsViewBuilder: (BuildContext context,
                  void Function(String) onSelected, Iterable<String> options) {
                return Material(
                  child: SingleChildScrollView(
                    child:
                    Column(
                      children:
                        options.map((e) {
                         return ListTile(
                           leading: CircleAvatar(
                             radius: 18,
                             backgroundColor: AppThemeData.primaryColor,
                             child: Text(e[0].toUpperCase(), style: const TextStyle(color: Colors.white),),
                           ),
                           title: Text(e, style: const TextStyle(fontWeight: bold, fontSize: 15),),
                         );
                        }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// return TextField(
// style: const TextStyle(color: Colors.white),
// decoration: dashboardFieldDecor(),
// onChanged: (val) {},
// );
