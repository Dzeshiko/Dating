import 'package:dating/data/mapper/dating_images_mapper.dart';
import 'package:dating/data/service/dating_service.dart';
import 'package:dating/domain/model/dating_image.dart';

class ApiUtil {
  final DatingService datingService;

  ApiUtil({
    required this.datingService,
  });

  Future<List<DatingImage?>> fetchDatingImages({
    required int cid,
  }) async {
    final _result = await datingService.getDatingImages(cid);
    return DatingImagesMapper.fromApi(_result);
  }
}
