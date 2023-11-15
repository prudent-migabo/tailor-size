import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tailor_size/data/data.dart';

class ClientRepository {
  CollectionReference clientRef =
      FirebaseFirestore.instance.collection('clients');

  Future<void> createClient(Map<String, dynamic> data) async {
    await clientRef.add(data);
  }

  Future<void> updateClient({required Map<String, dynamic> data, required String clientID}) async{
    await clientRef.doc(clientID).update(data);
  }

  Stream<ClientModel> getClient(String clientID){
    return clientRef.doc(clientID).snapshots().map((event) => ClientModel.fromMap(event));
  }

  Future<void> getClientDetails() async{}

  Stream<List<ClientModel>> listClients() {
    return clientRef
        .orderBy('createdAt', descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((event) => event.docs.map((e) => ClientModel.fromMap(e)).toList());
  }


  Future<String> listClientsNames() async{
    var res = await clientRef.get();
    for (var element in res.docs) {
      if(element.exists){
        Map? value = element.data() as Map;
        print('!!!!!!!!!!!!!! ${value['fullName']}');
        return value['fullName'];
      } else {
        return '';
      }
    }
    return '';
  }

  Stream<List<ClientModel>> listClientsByName(String fullName) {
    return clientRef
        .where('fullName', isEqualTo: fullName)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => ClientModel.fromMap(e)).toList());
  }

}
