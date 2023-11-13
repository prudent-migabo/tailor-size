import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/utils/utils.dart';

class UpdateClientPersonalDetails extends StatefulWidget {
  static const String routeName = '/UpdateClientPersonalDetails';
  const UpdateClientPersonalDetails({Key? key, required this.clientArguments}) : super(key: key);

  final ClientArguments clientArguments;

  @override
  State<UpdateClientPersonalDetails> createState() => _UpdateClientPersonalDetailsState();
}

class _UpdateClientPersonalDetailsState extends State<UpdateClientPersonalDetails> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _names = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String profession = '';

  onSubmit(){
    if(!_formKey.currentState!.validate()) return;
    Navigator.pushNamed(context, UpdateMeasureScreen.routeName, arguments: ClientArguments(clientModel: ClientModel(
      fullName: _names.text.trim(),
      phone: _phone.text.trim(),
      email: _email.text.trim(),
      profession: profession,
      c: widget.clientArguments.clientModel.c,
      cb1: widget.clientArguments.clientModel.cb1,
      cb2: widget.clientArguments.clientModel.cb2,
      cf: widget.clientArguments.clientModel.cf,
      cc1: widget.clientArguments.clientModel.cc1,
      cp: widget.clientArguments.clientModel.cp,
      cc2: widget.clientArguments.clientModel.cc2,
      cv: widget.clientArguments.clientModel.cv,
      ep: widget.clientArguments.clientModel.ep,
      lt: widget.clientArguments.clientModel.lt,
      ltp: widget.clientArguments.clientModel.ltp,
      p: widget.clientArguments.clientModel.p,
      tc: widget.clientArguments.clientModel.tc,
      clientID: widget.clientArguments.clientModel.clientID,
      shoulder: widget.clientArguments.clientModel.shoulder,
      belly: widget.clientArguments.clientModel.belly,
      bust: widget.clientArguments.clientModel.bust,
    )));
  }

  @override
  void initState() {
    _names.text = widget.clientArguments.clientModel.fullName!;
    _phone.text = widget.clientArguments.clientModel.phone!;
    _email.text = widget.clientArguments.clientModel.email!;
    profession = widget.clientArguments.clientModel.profession!;
    super.initState();
  }


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
          'Informations Personnelles',
          style: TextStyle(
              color: AppThemeData.textBlack, fontWeight: FontWeight.normal),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20),
            child: GestureDetector(
              onTap: onSubmit,
              child: const Text('Suivant', style: TextStyle(color: AppThemeData.textBlack),),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _names,
                validator: (value) => value!.isEmpty ? 'Ce champ ne peut pas être vide' : null,
                decoration: customFieldDecoration('Noms'),
              ),
              const SizedBox(height: 18,),
              DropdownButtonFormField(
                  decoration:  customFieldDecoration(profession),
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
                controller: _phone,
                decoration:  customFieldDecoration('Téléphone'),
              ),
              const SizedBox(height: 18,),
              TextFormField(
                controller: _email,
                decoration:  customFieldDecoration('E-mail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
