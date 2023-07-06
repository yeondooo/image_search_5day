import 'package:image_search_5day/data/api/pixabay_api.dart';
import 'package:image_search_5day/data/mapper/photo_mapper.dart';
import 'package:image_search_5day/domain/model/photo.dart';
import 'package:image_search_5day/domain/repository/photo_repository.dart';

class PixabayPhotoRespositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getImages(query);

    if (resultDto.hits == null) {
      return [];
    }

    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}
