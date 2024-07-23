import 'package:flutter/material.dart';

class TyingView extends StatefulWidget {
  const TyingView({super.key});

  @override
  State<TyingView> createState() => _TyingViewState();
}

class _TyingViewState extends State<TyingView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('typing'),
    );
  }
}
