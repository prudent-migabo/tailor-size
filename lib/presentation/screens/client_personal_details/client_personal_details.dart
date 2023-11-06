import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/utils/utils.dart';

class ClientPersonalDetails extends StatefulWidget {
  static const String routeName = '/ClientPersonalDetails';
  const ClientPersonalDetails({Key? key}) : super(key: key);

  @override
  State<ClientPersonalDetails> createState() => _ClientPersonalDetailsState();
}

class _ClientPersonalDetailsState extends State<ClientPersonalDetails> {

  String profession = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
            color: AppThemeData.iconBlack,
          ),
        ),
        title: const Text(
          'Informations Personnelles',
          style: TextStyle(
              color: AppThemeData.textBlack, fontWeight: FontWeight.normal),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20),
            child: Text('Suivant', style: TextStyle(color: AppThemeData.textBlack),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Noms',
                hintStyle: TextStyle(fontSize: 14)
              ),
            ),
            const SizedBox(height: 18,),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  // contentPadding:  EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  hintText: 'Profession',
                    hintStyle: TextStyle(fontSize: 14)
                ),
                items: ListsHelper.professions.map((item)
                => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: const TextStyle(fontSize: 13),))).toList(),
                onChanged: (value){
                  setState(() {
                    profession = value.toString();
                  });
                }),
            const SizedBox(height: 18,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Téléphone',
                  hintStyle: TextStyle(fontSize: 14)
              ),
            ),
            const SizedBox(height: 18,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'E-mail',
                  hintStyle: TextStyle(fontSize: 14)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
