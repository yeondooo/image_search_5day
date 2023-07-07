import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:image_search_5day/core/result.dart';
import 'package:image_search_5day/domain/use_case/get_top_ten_most_viewd_images_use_case.dart';
import 'package:image_search_5day/presentation/main/main_state.dart';
import 'package:image_search_5day/presentation/main/main_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final GetTopTenMostViewdImagesUseCase _getTopTenMostViewdImagesUseCase;
  final _eventController = StreamController<MainUiEvent>();

  Stream<MainUiEvent> get eventStream => _eventController.stream;

  MainViewModel(this._getTopTenMostViewdImagesUseCase);

  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    if (query.isEmpty) {
      _eventController.add(const ShowSnackBar('검색어를 입력하세요.'));
      return;
    }

    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final result = await _getTopTenMostViewdImagesUseCase.execute(query);

    switch (result) {
      case Success(:final data):
        _eventController.add(const ShowSnackBar('검색 결과는 조회수 순으로 10개가 정렬됩니다.'));
        _state = state.copyWith(photos: data, isLoading: false);
        notifyListeners();

      case Error(:final e):
        _eventController.add(ShowSnackBar(e));
    }
  }
}
