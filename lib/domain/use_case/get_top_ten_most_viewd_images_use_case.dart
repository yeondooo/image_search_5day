import 'package:image_search_5day/core/result.dart';
import 'package:image_search_5day/domain/model/photo.dart';
import 'package:image_search_5day/domain/repository/photo_repository.dart';

class GetTopTenMostViewdImagesUseCase {
  final PhotoRepository _repository;

  GetTopTenMostViewdImagesUseCase(this._repository);

  Future<Result<List<Photo>>> execute(String query) async {
    try {
      final photos = await _repository.getPhotos(query);
      photos.sort((a, b) => -a.views.compareTo(b.views));

      return Result.success(photos.take(10).toList());
    } catch (err) {
      return const Result.error('네트워크 에러');
    }
  }
}
