import 'package:dating/domain/model/dating_image.dart';

abstract class DatingRepository {
  Future<List<DatingImage?>> getDatingImages({
    required int cid,
  });
}
