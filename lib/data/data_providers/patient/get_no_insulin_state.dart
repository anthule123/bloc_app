import 'package:bloc_app/logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../models/export.dart';

Future<NoInsulinState> getNoInsulin(String id) async {
  // Firebase.initializeApp();
  var db = FirebaseFirestore.instance;
  var docRef = db.collection('test_patient').doc('${id}');
  final snap = await docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data();
      print(data.runtimeType);
      print(data);
      print('hêlo');
      // ...
    },
    onError: (e) => print("Error getting document: $e"),
  );
  print('after');
  return initNoInsulinState();
}
