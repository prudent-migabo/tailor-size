import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/business_logic/cubits/client_cubit/client_cubit.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/data/models/client_arguments.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/statics/statics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailor_size/utils/dialog_alerts.dart';

class UpdateMeasureProfileScreen extends StatefulWidget {
  static const String routeName = '/UpdateMeasureProfileScreen';
  final ClientArguments clientArguments;

  const UpdateMeasureProfileScreen({Key? key, required this.clientArguments})
      : super(key: key);

  @override
  State<UpdateMeasureProfileScreen> createState() =>
      _UpdateMeasureProfileScreenState();
}

class _UpdateMeasureProfileScreenState
    extends State<UpdateMeasureProfileScreen> {
  int shoulderValue = 0;
  int bellyValue = 0;
  int bustValue = 0;

  void setShoulder(int index) {
    setState(() {
      shoulderValue = index;
    });
  }

  void setBelly(int index) {
    setState(() {
      bellyValue = index;
    });
  }

  void setBust(int index) {
    setState(() {
      bustValue = index;
    });
  }

  @override
  void initState() {
    shoulderValue = widget.clientArguments.clientModel.shoulder!;
    bellyValue = widget.clientArguments.clientModel.belly!;
    bustValue = widget.clientArguments.clientModel.bust!;
    super.initState();
  }


  onSubmit(){
    context.read<ClientCubit>().updateClient(
        clientModel: ClientModel(
          fullName:
          widget.clientArguments.clientModel.fullName,
          profession: widget
              .clientArguments.clientModel.profession,
          email: widget.clientArguments.clientModel.email,
          phone: widget.clientArguments.clientModel.phone,
          tc: widget.clientArguments.clientModel.tc!.replaceAll('cm', ''),
          p: widget.clientArguments.clientModel.p!.replaceAll('cm', ''),
          ltp: widget.clientArguments.clientModel.ltp!.replaceAll('cm', ''),
          lt: widget.clientArguments.clientModel.lt!.replaceAll('cm', ''),
          ep: widget.clientArguments.clientModel.ep!.replaceAll('cm', ''),
          cv: widget.clientArguments.clientModel.cv!.replaceAll('cm', ''),
          cc2: widget.clientArguments.clientModel.cc2!.replaceAll('cm', ''),
          cp: widget.clientArguments.clientModel.cp!.replaceAll('cm', ''),
          cc1: widget.clientArguments.clientModel.cc1!.replaceAll('cm', ''),
          cf: widget.clientArguments.clientModel.cf!.replaceAll('cm', ''),
          cb2: widget.clientArguments.clientModel.cb2!.replaceAll('cm', ''),
          c: widget.clientArguments.clientModel.c!.replaceAll('cm', ''),
          cb1: widget.clientArguments.clientModel.cb1!.replaceAll('cm', ''),
          shoulder: shoulderValue,
          belly: bellyValue,
          bust: bustValue,
        ),
        clientID:
        widget.clientArguments.clientModel.clientID!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientCubit, ClientState>(
      listener: (context, state) {
        if (state.clientStatus == ClientStatus.submitted) {
          Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.routeName, (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Mise à jour sauvegardée avec succès'),
            ),
          );
        } else if (state.clientStatus == ClientStatus.error) {
          errorDialog(context, content: state.error);
        }
      },
      builder: (context, state) {
        return state.clientStatus == ClientStatus.submitting
            ? CustomLoading()
            : Scaffold(
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
                        color: AppThemeData.textBlack,
                        fontWeight: FontWeight.normal),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 20),
                      child: GestureDetector(
                        onTap: onSubmit,
                        child: const Text(
                          'Sauvegarder',
                          style: TextStyle(color: AppThemeData.textBlack),
                        ),
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
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<SelectShoulderCubit>()
                                    .selectShoulder(1);
                                setShoulder(1);
                              },
                              child: BlocBuilder<SelectShoulderCubit, int>(
                                builder: (context, state) {
                                  return state == 1 || shoulderValue == 1
                                      ? const ProfileCategorySelector(
                                          image: Assets.shoulder1,
                                        )
                                      : Image.asset(Assets.shoulder1);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              child: GestureDetector(onTap: () {
                            context
                                .read<SelectShoulderCubit>()
                                .selectShoulder(2);
                            setShoulder(2);
                          }, child: BlocBuilder<SelectShoulderCubit, int>(
                            builder: (context, state) {
                              return state == 2 || shoulderValue == 2
                                  ? const ProfileCategorySelector(
                                      image: Assets.shoulder2,
                                    )
                                  : Image.asset(Assets.shoulder2);
                            },
                          ))),
                          Expanded(
                              child: GestureDetector(onTap: () {
                            context
                                .read<SelectShoulderCubit>()
                                .selectShoulder(3);
                            setShoulder(3);
                          }, child: BlocBuilder<SelectShoulderCubit, int>(
                            builder: (context, state) {
                              return state == 3 || shoulderValue == 3
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
                            child: GestureDetector(
                              onTap: () {
                                context.read<SelectBellyCubit>().selectBelly(1);
                                setBelly(1);
                              },
                              child: BlocBuilder<SelectBellyCubit, int>(
                                builder: (context, state) {
                                  return state == 1 || bellyValue == 1
                                      ? const ProfileCategorySelector(
                                          image: Assets.belly1,
                                        )
                                      : Image.asset(Assets.belly1);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              child: GestureDetector(onTap: () {
                            context.read<SelectBellyCubit>().selectBelly(2);
                            setBelly(2);
                          }, child: BlocBuilder<SelectBellyCubit, int>(
                            builder: (context, state) {
                              return state == 2 || bellyValue == 2
                                  ? const ProfileCategorySelector(
                                      image: Assets.belly2,
                                    )
                                  : Image.asset(Assets.belly2);
                            },
                          ))),
                          Expanded(
                              child: GestureDetector(onTap: () {
                            context.read<SelectBellyCubit>().selectBelly(3);
                            setBelly(3);
                          }, child: BlocBuilder<SelectBellyCubit, int>(
                            builder: (context, state) {
                              return state == 3 || bellyValue == 3
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
                            child: GestureDetector(
                              onTap: () {
                                context.read<SelectBustCubit>().selectBust(1);
                                setBust(1);
                              },
                              child: BlocBuilder<SelectBustCubit, int>(
                                builder: (context, state) {
                                  return state == 1 || bustValue == 1
                                      ? const ProfileCategorySelector(
                                          image: Assets.bust1,
                                        )
                                      : Image.asset(Assets.bust1);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              child: GestureDetector(onTap: () {
                            context.read<SelectBustCubit>().selectBust(2);
                            setBust(2);
                          }, child: BlocBuilder<SelectBustCubit, int>(
                            builder: (context, state) {
                              return state == 2 || bustValue == 2
                                  ? const ProfileCategorySelector(
                                      image: Assets.bust2,
                                    )
                                  : Image.asset(Assets.bust2);
                            },
                          ))),
                          Expanded(
                              child: GestureDetector(onTap: () {
                            context.read<SelectBustCubit>().selectBust(3);
                            setBust(3);
                          }, child: BlocBuilder<SelectBustCubit, int>(
                            builder: (context, state) {
                              return state == 3 || bustValue == 3
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
      },
    );
  }
}
