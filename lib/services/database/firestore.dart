import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of order
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('order');

  //save order
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
      //add more fields as necessary
    });
  }
}
