import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/presentation/screens/dashboard_screen/components/components.dart';
import 'package:tailor_size/presentation/widgets/custom_appbar.dart';
import 'package:tailor_size/statics/statics.dart';
import 'package:tailor_size/utils/utils.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isTextFieldHidden = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(context),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
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
              );
            }
          ),
        ),
        title: isTextFieldHidden
            ? Container()
            : TextField(
          controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: dashboardFieldDecor(),
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
                onSubmitted: (String value) {
                  _controller.clear();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchResultScreen(
                                value: value,
                              )));
                },
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
      body: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          return state.clients.isEmpty
              ? const Center(
                  child: Text('Aucun client enregistré'),
                )
              : ListView.builder(
            padding: padding20,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.clients.length,
                  itemBuilder: (context, index) {
                    final data = state.clients[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (val) {
                              ClientRepository().deleteClient(data.clientID!);
                            },
                            backgroundColor: AppThemeData.textError,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Supprimer',
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                      child: CustomCardListTile(
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
                          subtitle: data.profession!),
                    );
                  });
        },
      ),
    );
  }
}
