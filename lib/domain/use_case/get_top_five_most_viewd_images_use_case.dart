import 'package:image_search_5day/domain/model/photo.dart';
import 'package:image_search_5day/domain/repository/photo_repository.dart';

class GetTopFiveMoseViewdImagesUseCase {
  final PhotoRepository _repository;

  GetTopFiveMoseViewdImagesUseCase(this._repository);

  Future<List<Photo>> execute(String query) async {
    final photos = await _repository.getPhotos(query);

    photos.sort((a, b) => -a.views.compareTo(b.views));

    return photos.take(10).toList();
  }
}
