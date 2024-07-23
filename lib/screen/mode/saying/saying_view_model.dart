import 'package:typing_practice/screen/common/base_view_model.dart';

class SayingViewModel extends BaseViewModel {
  String mode = 'saying';

  @override
  late final practiceTexts = loadData();
}
