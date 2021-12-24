import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class Database {
  // static Database get to => Get.find();

   FirebaseFirestore firestore;

  initialize() {
    firestore = FirebaseFirestore.instance;
  }

  void firebaseDbListner(Function(bool) res)
  {
    CollectionReference reference = firestore.collection('todo_info');
    reference.snapshots().listen((querySnapshot) {
      querySnapshot.docChanges.forEach((change) {

       // print("info is : ${change.doc['info']} and timedate is : ${change.doc['timedate']}");
        // Do something with change
        res(true);
      });
    });
  }

  Future<void> create(String name, String code) async {
    try {
      await firestore
          .collection('todo_info')
          .add({'info': name, 'timedate': code});
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("todo_info").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('todo_info').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"info": doc['info'], "timedate": doc['timedate']};
          docs.add(a);
        }
        return docs;
      }
      return docs;
    } catch (e) {
      print(e);
      return docs;
    }
  }

  Future<void> update(String id, String name, String code) async {
    try {
      await firestore
          .collection("todo_info")
          .doc(id)
          .update({'info': name, 'timedate': code});
    } catch (e) {
      print(e);
    }
  }
}
