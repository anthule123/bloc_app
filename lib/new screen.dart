import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator_bar.dart';
import 'package:flutter/material.dart';

import 'presentation/widgets/internet_check_widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tên trang'),
      ),
      body: Column(
        children: [
          InternetCheck(),
        ],
      ),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}
