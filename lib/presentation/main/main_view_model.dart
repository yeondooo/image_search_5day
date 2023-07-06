import 'package:flutter/cupertino.dart';
import 'package:image_search_5day/domain/use_case/get_top_five_most_viewd_images_use_case.dart';
import 'package:image_search_5day/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveMoseViewdImagesUseCase _getTopFiveMoseViewdImagesUseCase;

  MainViewModel(this._getTopFiveMoseViewdImagesUseCase);

  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
        photos: await _getTopFiveMoseViewdImagesUseCase.execute(query),
        isLoading: false);
    notifyListeners();
  }
}
