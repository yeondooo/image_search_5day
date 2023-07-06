import 'package:image_search_5day/data/dto/pixabay_result_dto.dart';
import 'package:image_search_5day/domain/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      webformatURL: webformatURL ?? '',
      views: views ?? 0,
      likes: likes ?? 0,
      tags: tags ?? '',
      user: user ?? '',
      userImageURL: userImageURL ?? '',
    );
  }
}
