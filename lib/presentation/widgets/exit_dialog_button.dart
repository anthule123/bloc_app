import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

class exitDialogButton extends StatelessWidget {
  final String text;
  const exitDialogButton({
    Key? key,
    this.text = 'Thoát',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NiceButtons(
        startColor: Colors.pink.shade100,
        endColor: Colors.pink.shade100,
        stretch: false,
        progress: true,
        onTap: (finish) {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        child: Text(text));
  }
}
