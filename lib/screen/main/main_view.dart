import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typing_practice/screen/common/base_view.dart';
import 'package:typing_practice/screen/main/main_view_model.dart';
import 'package:typing_practice/screen/mode/custom/custom_view.dart';
import 'package:typing_practice/screen/mode/poem/poem_view.dart';
import 'package:typing_practice/screen/mode/saying/saying_view.dart';
import 'package:typing_practice/screen/mode/word/word_view.dart';
import 'package:typing_practice/screen/widget/mode_card.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final MainViewModel mainViewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: mainViewModel,
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: const Text(
            '타자연습',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
                size: 32,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 150,
                child: const Card(
                  child: Text('anything'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ModeCard(
                    modeTitle: Mode.poem.kor.toString().split('.').last,
                    onSelectedMode: () {
                      Get.to(() => const PoemView());
                    },
                  ),
                  ModeCard(
                    modeTitle: Mode.novel.kor.toString().split('.').last,
                    onSelectedMode: () {
                      Get.to(() => WordView());
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ModeCard(
                    modeTitle: Mode.word.kor.toString().split('.').last,
                    onSelectedMode: () {
                      Get.to(() => const SayingView());
                    },
                  ),
                  ModeCard(
                    modeTitle: Mode.custom.kor.toString().split('.').last,
                    onSelectedMode: () {
                      Get.to(() => const CustomView());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
