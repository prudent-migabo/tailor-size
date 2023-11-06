import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/presentation/widgets/custom_appbar.dart';
import 'package:tailor_size/presentation/widgets/custom_card_list_tile.dart';
import 'package:tailor_size/statics/statics.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/DashboardScreen';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: AppThemeData.listTileBackgroundColor.withOpacity(.3),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
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
        title: TextField(),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 20),
            child:  Icon(Icons.search, color: AppThemeData.iconGrey,),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: (){},
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: ListView.builder(
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index){
            return const CustomCardListTile(textInLeading: 'A', title: 'Alexandre Doe', subtitle: 'Medecin');
        }),
      ),
    );
  }
}
