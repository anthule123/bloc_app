import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/patient.dart';

Future<DataSending> createPatient(Patient patient) async {
  // Firebase.initializeApp();
  final data = <String, String>{
    "name": patient.name,
    "id": patient.id,
  };
  var db = FirebaseFirestore.instance;

  db.collection("patient").doc("user${patient.id}").set(data).onError((e, _) {
    return dataSending.failure;
  });
  return dataSending.success;
}
