import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tên trang'),
      ),
      body: Column(),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}
