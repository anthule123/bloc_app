import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../models/export.dart';

Future<DataSending> createPatient(Profile profile) async {
  // Firebase.initializeApp();
  final data = <String, dynamic>{
    "name": profile.name,
    "id": profile.id,
    "weight": profile.weight,
  };
  final statusData = <String, String>{
    "status": PatientStatus.firstAsk.toString(),
  };
  var db = FirebaseFirestore.instance;

  db
      .collection("test_patient")
      .doc("${profile.id}")
      .collection('profile')
      .doc('single')
      .set(data)
      .onError((e, _) {
    return DataSending.failure;
  });
  db
      .collection("test_patient")
      .doc('${profile.id}')
      .set(statusData)
      .onError((error, stackTrace) => DataSending.failure);
  return DataSending.success;
}
