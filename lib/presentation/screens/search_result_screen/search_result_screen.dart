import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';

class SearchResultScreen extends StatefulWidget {
  static const String routeName = '/SearchResultScreen';
  const SearchResultScreen({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppThemeData.scaffoldColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppThemeData.iconBlack,
          ),
        ),
        title: const Text('Resultat de recherche',
          style: TextStyle(
            color: AppThemeData.textBlack, fontWeight: FontWeight.normal),),
      ),
      body: StreamBuilder<List<ClientModel>>(
        stream: ClientRepository().listClientsByName(widget.value),
        builder: (context, snapshot) {
          List<ClientModel>? list = snapshot.data;
          print('&&&&&&&&&&& ${snapshot.data}');
          if (!snapshot.hasData || list!.isEmpty){
            return const Center(child: Text('Aucune donnée trouvée'),);
          } else if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: Text('En attente...'),);
          }
          return ListView.builder(
            padding: padding20,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final data = list[index];
                return CustomCardListTile(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ClientDetailsScreen.routeName,
                          arguments: ClientArguments(
                              clientModel: ClientModel(
                                bust: data.bust,
                                belly: data.belly,
                                shoulder: data.shoulder,
                                cb1: data.cb1,
                                c: data.c,
                                cb2: data.cb2,
                                cf: data.cf,
                                cc1: data.cc1,
                                cp: data.cp,
                                cc2: data.cc2,
                                cv: data.cv,
                                ep: data.ep,
                                lt: data.lt,
                                ltp: data.ltp,
                                p: data.p,
                                tc: data.tc,
                                phone: data.phone,
                                email: data.email,
                                profession: data.profession,
                                clientID: data.clientID,
                                fullName: data.fullName,
                              )));
                    },
                    textInLeading: data.fullName![0].toUpperCase(),
                    title: data.fullName!,
                    subtitle: data.profession!);
              });
        }
      ),
    );
  }
}
