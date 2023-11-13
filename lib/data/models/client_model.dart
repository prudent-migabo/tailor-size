import 'package:cloud_firestore/cloud_firestore.dart';

class ClientModel {
  String? fullName;
  String? profession;
  String? phone;
  String? email;
  String? lt;
  String? cc1;
  String? cv;
  String? ltp;
  String? cp;
  String? cf;
  String? ep;
  String? cc2;
  String? c;
  String? tc;
  String? cb1;
  String? p;
  String? cb2;
  int? shoulder;
  int? belly;
  int? bust;
  DateTime? createdAt;
  String? clientID;

//<editor-fold desc="Data Methods">
  ClientModel({
    this.fullName,
    this.profession,
    this.phone,
    this.email,
    this.lt,
    this.cc1,
    this.cv,
    this.ltp,
    this.cp,
    this.cf,
    this.ep,
    this.cc2,
    this.c,
    this.tc,
    this.cb1,
    this.p,
    this.cb2,
    this.shoulder,
    this.belly,
    this.bust,
    this.createdAt,
    this.clientID,
  });


  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'profession': profession,
      'phone': phone,
      'email': email,
      'lt': lt,
      'cc': cc1,
      'cv': cv,
      'ltp': ltp,
      'cp': cp,
      'cf': cf,
      'ep': ep,
      'cc2': cc2,
      'c': c,
      'tc': tc,
      'cb': cb1,
      'p': p,
      'cb2': cb2,
      'shoulder': shoulder,
      'belly': belly,
      'bust': bust,
      'createdAt': DateTime.now(),
    };
  }

  factory ClientModel.fromMap(DocumentSnapshot doc) {
    Map map = doc.data()! as Map;
    return ClientModel(
      fullName: map['fullName'] ?? '',
      profession: map['profession'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      lt: map['lt'] ?? '',
      cc1: map['cc'] ?? '',
      cv: map['cv'] ?? '',
      ltp: map['ltp'] ?? '',
      cp: map['cp'] ?? '',
      cf: map['cf'] ?? '',
      ep: map['ep'] ?? '',
      cc2: map['cc2'] ?? '',
      c: map['c'] ?? '',
      tc: map['tc'] ?? '',
      cb1: map['cb'] ?? '',
      p: map['p'] ?? '',
      cb2: map['cb2'] ?? '',
      shoulder: map['shoulder'] ?? 0,
      belly: map['belly']  ?? 0,
      bust: map['bust'] ?? 0,
      clientID: doc.id,
    );
  }

//</editor-fold>
}