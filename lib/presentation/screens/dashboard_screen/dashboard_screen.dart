import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/presentation/widgets/custom_appbar.dart';
import 'package:tailor_size/presentation/widgets/custom_card_list_tile.dart';
import 'package:tailor_size/statics/statics.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isTextFieldHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: AppThemeData.listTileBackgroundColor.withOpacity(.3),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () {
              AuthRepository().signOutUser();
              Navigator.pushNamedAndRemoveUntil(
                  context, WelcomeScreen.routeName, (route) => false);
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.appLogo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        title: isTextFieldHidden
            ? Container()
            : TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    fillColor: AppThemeData.backgroundGrey,
                    filled: true,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Rechercher un client',
                    hintStyle:
                        const TextStyle(fontSize: 13, color: Colors.white)),
                onChanged: (val) {},
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTextFieldHidden = !isTextFieldHidden;
                  });
                },
                child: const Icon(
                  Icons.search,
                  color: AppThemeData.iconGrey,
                )),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ClientPersonalDetails.routeName);
        },
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: BlocBuilder<ClientCubit, ClientState>(
          builder: (context, state) {
            return state.clients.isEmpty
                ? const Center(
                    child: Text('Aucun client enregistré'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.clients.length,
                    itemBuilder: (context, index) {
                      final data = state.clients[index];
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
          },
        ),
      ),
    );
  }
}
