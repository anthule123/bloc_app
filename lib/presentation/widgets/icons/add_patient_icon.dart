import 'package:flutter/material.dart';

class AddPatientIcon extends StatelessWidget {
  const AddPatientIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.person_add,
      color: Colors.amberAccent,
      size: 34.0,
    );
  }
}