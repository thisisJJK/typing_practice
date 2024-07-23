import 'package:typing_practice/screen/common/base_view_model.dart';

class PoemViewModel extends BaseViewModel {
  String mode = 'poem';

  @override
  late final practiceTexts = loadData();
}
