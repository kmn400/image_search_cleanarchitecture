import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_0130/data/data_source/result.dart';
import 'package:image_search_0130/domain/model/photo.dart';
import 'package:image_search_0130/domain/repository/photo_api_repository.dart';
import 'package:image_search_0130/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_0130/presentation/home/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다', () async {
    final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));
    //
    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 887443,
    "pageURL":
        "https://pixabay.com/photos/flower-life-yellow-flower-crack-887443/",
    "type": "photo",
    "tags": "flower, life, yellow flower",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/08/13/20/06/flower-887443_150.jpg",
    "previewWidth": 150,
    "previewHeight": 116,
    "webformatURL":
        "https://pixabay.com/get/gbec1615c09caced64ad04b38fa831d4c97b82b56df3470d3985199e4729e5590dd5ea607cceba55992c8f8f6dde0535e_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 497,
    "largeImageURL":
        "https://pixabay.com/get/g353e82dbf19e9a5990fe947ad78518dfa7b03283cc406bedad475f577bfe6ccd70b10e34e931863198be6afded4311914dbc4bfbb5ad3473ca2d55d662689438_1280.jpg",
    "imageWidth": 3867,
    "imageHeight": 3005,
    "imageSize": 2611531,
    "views": 263452,
    "downloads": 156623,
    "collections": 3573,
    "likes": 1023,
    "comments": 165,
    "user_id": 1298145,
    "user": "klimkin",
    "userImageURL":
        "https://cdn.pixabay.com/user/2017/07/18/13-46-18-393_250x250.jpg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gdb46e90a1679dafd2e6bf1a5cd8f766fe65e42e36b436ea982ddd46b85e57f8e04faf0caa1e5f6e68a5be9dc5987fd21631a7357af3db23ff2d05334b1991a69_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g226ca1c723e71d527d447429cacf3c01c10016b887fe7a1f62c2cb7656d2f402d52c119be69b7b4b9ced2445e556062ee8031a9b1690595a6f1468080979a985_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 934587,
    "downloads": 602632,
    "collections": 2889,
    "likes": 1427,
    "comments": 307,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  }
];
