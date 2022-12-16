import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../models/export.dart';

Future<bool> checkExistedID(String id) async {
  // Firebase.initializeApp();
  if (id == '') return false;
  var db = FirebaseFirestore.instance;
  var docRef = db.collection('test_patient').doc('${id}');
  bool ans = true;
  final snap = await docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data();
      print(data.runtimeType);
      (data);
      if (data.runtimeType == Null) {
        ans = false;
        // return false;
      }
      // ...
    },
    onError: (e) => print("Error getting document: $e"),
  );
  print('after');
  return ans;
}
