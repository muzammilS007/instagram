import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:instagram/data/model/messages.dart';
import 'package:instagram/data/model/signup_model.dart';

class Database {
  // static Database get to => Get.find();

  FirebaseFirestore? firestore;

  Database() {
    firestore = FirebaseFirestore.instance;
  }

  void firebaseDbListner(Function(String) res) {
    var json;
    CollectionReference? reference = firestore?.collection('messages');
    reference?.snapshots().listen((querySnapshot) {
      querySnapshot.docChanges.forEach((change) {
        // Do something with change
        //   Map<String, dynamic> jsonData = json.decode(change.doc.data()) as Map<String, dynamic>;
        print("info is ping ${change.doc.get('message')}");
        res(change.doc.get("message"));
        /*  print("info is : ${change.doc.get("message")}");
        res(change.doc.get("message"));*/
      });
    });
  }

  Future<void> create(key, dynamic data, [String? mainKey]) async {
    try {
      await firestore?.collection(mainKey ?? 'userInfo').add(data.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore?.collection("todo_info").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot? querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore?.collection('todo_info').get();
      if (querySnapshot!.docs.isNotEmpty) {
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
          ?.collection("todo_info")
          .doc(id)
          .update({'info': name, 'timedate': code});
    } catch (e) {
      print(e);
    }
  }
}
