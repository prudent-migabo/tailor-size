import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/statics/statics.dart';

class MeasureProfileScreen extends StatelessWidget {
  static const String routeName = '/MeasureProfileScreen';

  const MeasureProfileScreen({Key? key}) : super(key: key);

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
          'Profile',
          style: TextStyle(
              color: AppThemeData.textBlack, fontWeight: FontWeight.normal),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 20),
            child: Text(
              'Sauvegarder',
              style: TextStyle(color: AppThemeData.textBlack),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Epaules'),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: GestureDetector(onTap: () {
                    context.read<SelectShoulderCubit>().selectShoulder(1);
                  }, child: BlocBuilder<SelectShoulderCubit, int>(
                    builder: (context, state) {
                      return state == 1
                          ? const ProfileCategorySelector(
                              image: Assets.shoulder1,
                            )
                          : Image.asset(Assets.shoulder1);
                    },
                  ),),
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          context
                              .read<SelectShoulderCubit>()
                              .selectShoulder(2);
                        },
                        child: BlocBuilder<SelectShoulderCubit, int>(
                          builder: (context, state) {
                            return state == 2
                                ? const ProfileCategorySelector(
                              image: Assets.shoulder2,
                            )
                                : Image.asset(Assets.shoulder2);
                          },
                        ))),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          context
                              .read<SelectShoulderCubit>()
                              .selectShoulder(3);
                        },
                        child: BlocBuilder<SelectShoulderCubit, int>(
                          builder: (context, state) {
                            return state == 3
                                ? const ProfileCategorySelector(
                              image: Assets.shoulder3,
                            )
                                : Image.asset(Assets.shoulder3);
                          },
                        ))),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Ventre'),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(onTap: () {
                    context.read<SelectBellyCubit>().selectBelly(1);
                  }, child: BlocBuilder<SelectBellyCubit, int>(
                    builder: (context, state) {
                      return state == 1
                          ? const ProfileCategorySelector(
                        image: Assets.belly1,
                      )
                          : Image.asset(Assets.belly1);
                    },
                  ),),
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          context.read<SelectBellyCubit>().selectBelly(2);
                        },
                        child: BlocBuilder<SelectBellyCubit, int>(
                          builder: (context, state) {
                            return state == 2
                                ? const ProfileCategorySelector(
                              image: Assets.belly2,
                            )
                                : Image.asset(Assets.belly2);
                          },
                        ))),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          context
                              .read<SelectBellyCubit>()
                              .selectBelly(3);
                        },
                        child: BlocBuilder<SelectBellyCubit, int>(
                          builder: (context, state) {
                            return state == 3
                                ? const ProfileCategorySelector(
                              image: Assets.belly3,
                            )
                                : Image.asset(Assets.belly3);
                          },
                        ))),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Buste'),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(onTap: () {
                    context.read<SelectBustCubit>().selectBust(1);
                  }, child: BlocBuilder<SelectBustCubit, int>(
                    builder: (context, state) {
                      return state == 1
                          ? const ProfileCategorySelector(
                        image: Assets.bust1,
                      )
                          : Image.asset(Assets.bust1);
                    },
                  ),),
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          context
                              .read<SelectBustCubit>()
                              .selectBust(2);
                        },
                        child: BlocBuilder<SelectBustCubit, int>(
                          builder: (context, state) {
                            return state == 2
                                ? const ProfileCategorySelector(
                              image: Assets.bust2,
                            )
                                : Image.asset(Assets.bust2);
                          },
                        ))),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          context
                              .read<SelectBustCubit>()
                              .selectBust(3);
                        },
                        child: BlocBuilder<SelectBustCubit, int>(
                          builder: (context, state) {
                            return state == 3
                                ? const ProfileCategorySelector(
                              image: Assets.bust3,
                            )
                                : Image.asset(Assets.bust3);
                          },
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
