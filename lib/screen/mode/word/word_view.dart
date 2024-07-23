import 'package:flutter/material.dart';
import 'package:typing_practice/screen/common/base_view.dart';
import 'package:typing_practice/screen/mode/word/word_view_model.dart';

class WordView extends StatefulWidget {
  const WordView({super.key});

  @override
  State<WordView> createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  final WordViewModel wordViewModel = WordViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: wordViewModel,
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text('속담'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: wordViewModel.practiceTexts,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (snapshot.data == null || !snapshot.hasData) {
              return const Center(
                child: Text('No Data'),
              );
            } else {
              List<dynamic> sayingItems =
                  snapshot.data![wordViewModel.mode][wordViewModel.lang];
              return Container(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: sayingItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(sayingItems[index]['title']),
                        subtitle: Text(sayingItems[index]['name']),
                        onTap: () {
                          //Get.to(page)
                        },
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.language),
          onPressed: () {
            setState(() {
              wordViewModel.isLangKor
                  ? wordViewModel.lang = 'eng'
                  : wordViewModel.lang = 'kor';
              wordViewModel.isLangKor = !wordViewModel.isLangKor;
            });
          },
        ),
      ),
    );
  }
}
