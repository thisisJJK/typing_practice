import 'package:flutter/material.dart';
import 'package:typing_practice/screen/common/base_view.dart';
import 'package:typing_practice/screen/mode/poem/poem_view_model.dart';

class PoemView extends StatefulWidget {
  const PoemView({
    super.key,
  });

  @override
  State<PoemView> createState() => _PoemViewState();
}

class _PoemViewState extends State<PoemView> {
  final PoemViewModel poemViewModel = PoemViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: poemViewModel,
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text('시'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: poemViewModel.practiceTexts,
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
              List<dynamic> poemItems =
                  snapshot.data![poemViewModel.mode][poemViewModel.lang];
              return Container(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: poemItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(poemItems[index]['title']),
                        subtitle: Text(poemItems[index]['name']),
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
              poemViewModel.isLangKor
                  ? poemViewModel.lang = 'eng'
                  : poemViewModel.lang = 'kor';
              poemViewModel.isLangKor = !poemViewModel.isLangKor;
            });
          },
        ),
      ),
    );
  }
}
