import 'package:flutter/material.dart';
import 'package:typing_practice/screen/common/base_view.dart';
import 'package:typing_practice/screen/mode/saying/saying_view_model.dart';

class SayingView extends StatefulWidget {
  const SayingView({super.key});

  @override
  State<SayingView> createState() => _SayingViewState();
}

class _SayingViewState extends State<SayingView> {
  final SayingViewModel sayingViewModel = SayingViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: sayingViewModel,
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text('속담'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: sayingViewModel.practiceTexts,
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
                  snapshot.data![sayingViewModel.mode][sayingViewModel.lang];
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
              sayingViewModel.isLangKor
                  ? sayingViewModel.lang = 'eng'
                  : sayingViewModel.lang = 'kor';
              sayingViewModel.isLangKor = !sayingViewModel.isLangKor;
            });
          },
        ),
      ),
    );
  }
}
