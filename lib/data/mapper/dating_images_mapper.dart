import 'package:dating/data/api/model/api_dating_image.dart';
import 'package:dating/domain/model/dating_image.dart';

class DatingImagesMapper {
  static List<DatingImage?> fromApi(List<ApiDatingImage?> apiDatingImages) {
    return apiDatingImages.map((ApiDatingImage? e) {
      return e == null
          ? null
          : DatingImage(
              id: e.id,
              name: e.name,
              username: e.username,
              avatar: e.avatar,
              hero: e.hero,
            );
    }).toList();
  }
}
