import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class GreyNextButton extends StatelessWidget {
  final String newText;
  GreyNextButton({
    Key? key,
    this.newText = 'Tiếp tục',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NiceButtons(
      stretch: false,
      borderColor: Colors.grey,
      endColor: Colors.grey.shade400,
      startColor: Colors.grey.shade300,
      onTap: (finish) {},
      child: Text(newText),
    );
  }
}
