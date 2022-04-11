import 'package:dating/data/api/api_util.dart';
import 'package:dating/data/service/dating_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    return _apiUtil ??= ApiUtil(
      datingService: DatingService(),
    );
  }
}
