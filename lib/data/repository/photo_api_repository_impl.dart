import 'package:image_search_0130/data/data_source/pixabay_api.dart';
import 'package:image_search_0130/domain/model/photo.dart';
import 'package:image_search_0130/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);

    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
