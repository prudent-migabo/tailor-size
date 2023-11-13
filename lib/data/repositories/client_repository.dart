import 'package:cloud_firestore/cloud_firestore.dart';

class ClientRepository {

  CollectionReference clientRef = FirebaseFirestore.instance.collection('clients');

  Future<void> createClient (Map<String, dynamic> data) async{
    await clientRef.add(data);
  }

}