import 'package:dating/data/api/model/api_dating_image.dart';
import 'package:dating/data/constant/api_constant.dart';
import 'package:dio/dio.dart';

class DatingService {
  static const _baseUrl = ApiConstant.baseUrl;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
    ),
  );

  Future<List<ApiDatingImage?>> getDatingImages(int cid) async {
    final _response = await _dio.get(
      '/get/dating/images',
      queryParameters: {
        'cid': cid,
      },
    );
    List<ApiDatingImage?> apiDatingImages = _response.data?.map<ApiDatingImage>((e) {
      return e == null ? null : ApiDatingImage.fromApi(e);
    })?.toList();
    return apiDatingImages;
  }
}
