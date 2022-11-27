import 'package:bloc_app/logic/cubits/patient_add/patient_add_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/patient.dart';

Future<dataSending> createPatient(Patient patient) async {
  // Firebase.initializeApp();
  final data = <String, String>{
    "name": patient.name,
    "id": patient.id,
  };
  var db = FirebaseFirestore.instance;
  
  db.collection("patient").doc("${patient.id}").set(data).onError((e, _) {
    return dataSending.failure;
  });
  return dataSending.success;
}
