import 'package:dating/data/api/api_util.dart';
import 'package:dating/domain/model/dating_image.dart';
import 'package:dating/domain/repository/dating_repository.dart';

class DatingDataRepository extends DatingRepository {
  final ApiUtil _apiUtil;

  DatingDataRepository(this._apiUtil);

  @override
  Future<List<DatingImage?>> getDatingImages({required int cid}) async {
    return await _apiUtil.fetchDatingImages(cid: cid);
  }
}
