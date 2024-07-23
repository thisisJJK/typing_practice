import 'package:typing_practice/screen/common/base_view_model.dart';

class WordViewModel extends BaseViewModel {
  String mode = 'word';
  @override
  late final practiceTexts = loadData();
}
