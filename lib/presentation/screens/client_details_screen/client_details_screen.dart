import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/screens/client_details_screen/components/components.dart';
import 'package:tailor_size/statics/assets.dart';
import 'package:tailor_size/statics/constants.dart';

class ClientDetailsScreen extends StatelessWidget {
  static const String routeName = '/ClientDetailsScreen';

  const ClientDetailsScreen({Key? key}) : super(key: key);

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
          'Detail',
          style: TextStyle(
              color: AppThemeData.textBlack, fontWeight: FontWeight.normal),
        ),
        actions: [
          SvgPicture.asset(Assets.shareIcon),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset(Assets.editIcon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppThemeData.listTileBackgroundColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppThemeData.backgroundGrey),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserHeader(
                textInLeading: 'A',
                name: 'Alexander Doe',
                profession: 'Medecin',
                phone: '0995006529',
                email: 'prud@gmail.com',
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10),
                child: Divider(color: AppThemeData.backgroundGrey, thickness: 1,),
              ),
              UserBody(
                  lt: '300 cm',
                  cv: '300 cm',
                  cp: '300 cm',
                  ep: '300 cm',
                  c: '300 cm',
                  cb1: '300 cm',
                  cb2: '300 cm',
                  cc1: '300 cm',
                  cf: '300 cm',
                  cc2: '300 cm',
                  tc: '300 cm',
                  p: '300 cm',
                  ltp: '300 cm'),
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: 10),
                child: Divider(color: AppThemeData.backgroundGrey, thickness: 1,),
              ),
              UserFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
