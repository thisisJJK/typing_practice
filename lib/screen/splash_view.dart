import 'dart:async';

import 'package:flutter/material.dart';
import 'package:typing_practice/screen/common/base_view_model.dart';
import 'package:typing_practice/screen/main/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final BaseViewModel baseViewModel = BaseViewModel();
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      baseViewModel.loadData();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Typing Practice',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
