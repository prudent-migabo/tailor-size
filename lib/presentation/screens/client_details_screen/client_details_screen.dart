import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/presentation/screens/client_details_screen/components/components.dart';
import 'package:tailor_size/statics/assets.dart';
import 'package:tailor_size/statics/constants.dart';

class ClientDetailsScreen extends StatelessWidget {
  static const String routeName = '/ClientDetailsScreen';

  const ClientDetailsScreen({Key? key, required this.clientArguments})
      : super(key: key);

  final ClientArguments clientArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppThemeData.iconBlack,
          ),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(
              color: AppThemeData.textBlack, fontWeight: FontWeight.normal),
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(Assets.shareIcon)),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, UpdateClientPersonalDetails.routeName,
                  arguments: ClientArguments(
                      clientModel: ClientModel(
                    bust: clientArguments.clientModel.bust,
                    belly: clientArguments.clientModel.belly,
                    shoulder: clientArguments.clientModel.shoulder,
                    cb1: clientArguments.clientModel.cb1,
                    c: clientArguments.clientModel.c,
                    cb2: clientArguments.clientModel.cb2,
                    cf: clientArguments.clientModel.cf,
                    cc1: clientArguments.clientModel.cc1,
                    cp: clientArguments.clientModel.cp,
                    cc2: clientArguments.clientModel.cc2,
                    cv: clientArguments.clientModel.cv,
                    ep: clientArguments.clientModel.ep,
                    lt: clientArguments.clientModel.lt,
                    ltp: clientArguments.clientModel.ltp,
                    p: clientArguments.clientModel.p,
                    tc: clientArguments.clientModel.tc,
                    phone: clientArguments.clientModel.phone,
                    email: clientArguments.clientModel.email,
                    profession: clientArguments.clientModel.profession,
                    clientID: clientArguments.clientModel.clientID,
                    fullName: clientArguments.clientModel.fullName,
                  )));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SvgPicture.asset(Assets.editIcon),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppThemeData.secondaryColor.withOpacity(.4),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppThemeData.backgroundGrey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserHeader(
                textInLeading:
                    clientArguments.clientModel.fullName![0].toUpperCase(),
                name: clientArguments.clientModel.fullName!,
                profession: clientArguments.clientModel.profession!,
                phone: clientArguments.clientModel.phone!,
                email: clientArguments.clientModel.email!,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: AppThemeData.backgroundGrey,
                  thickness: 1,
                ),
              ),
              UserBody(
                  lt:
                      '${clientArguments.clientModel.lt!.replaceAll(' ', '')} cm',
                  cv:
                      '${clientArguments.clientModel.cv!.replaceAll(' ', '')} cm',
                  cp:
                      '${clientArguments.clientModel.cp!.replaceAll(' ', '')} cm',
                  ep:
                      '${clientArguments.clientModel.ep!.replaceAll(' ', '')} cm',
                  c: '${clientArguments.clientModel.c!.replaceAll(' ', '')} cm',
                  cb1:
                      '${clientArguments.clientModel.cb1!.replaceAll(' ', '')} cm',
                  cb2:
                      '${clientArguments.clientModel.cb2!.replaceAll(' ', '')} cm',
                  cc1:
                      '${clientArguments.clientModel.cc1!.replaceAll(' ', '')} cm',
                  cf:
                      '${clientArguments.clientModel.cf!.replaceAll(' ', '')} cm',
                  cc2:
                      '${clientArguments.clientModel.cc2!.replaceAll(' ', '')} cm',
                  tc:
                      '${clientArguments.clientModel.tc!.replaceAll(' ', '')} cm',
                  p: '${clientArguments.clientModel.p!.replaceAll(' ', '')} cm',
                  ltp:
                      '${clientArguments.clientModel.ltp!.replaceAll(' ', '')} cm'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: AppThemeData.backgroundGrey,
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: clientArguments.clientModel.shoulder == 1
                          ? Image.asset(Assets.shoulder1)
                          : clientArguments.clientModel.shoulder == 2
                              ? Image.asset(Assets.shoulder2)
                              : clientArguments.clientModel.shoulder == 3
                                  ? Image.asset(Assets.shoulder3)
                                  : Container()),
                  const SizedBox(width: 20),
                  Expanded(
                      child: clientArguments.clientModel.belly == 1
                          ? Image.asset(Assets.belly1)
                          : clientArguments.clientModel.belly == 2
                              ? Image.asset(Assets.belly2)
                              : clientArguments.clientModel.belly == 3
                                  ? Image.asset(Assets.belly3)
                                  : Container()),
                  const SizedBox(width: 20),
                  Expanded(
                      child: clientArguments.clientModel.bust == 1
                          ? Image.asset(Assets.bust1)
                          : clientArguments.clientModel.bust == 2
                              ? Image.asset(Assets.bust2)
                              : clientArguments.clientModel.bust == 3
                                  ? Image.asset(Assets.bust3)
                                  : Container()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
