import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: BaseColors.charcoal.shade900,
        ),
        body: Container(
          color: BaseColors.charcoal.shade900,
        ),
      ),
    );
  }
}
