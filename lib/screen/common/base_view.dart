import 'package:flutter/material.dart';
import 'package:typing_practice/screen/common/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.builder,
  });

  final T viewModel;
  final Widget Function(
    BuildContext context,
    T viewModel,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      viewModel,
    );
  }
}
