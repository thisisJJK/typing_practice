import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  const CustomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(child: Text('custom'),),
    );
  }
}