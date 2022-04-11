import 'package:dating/data/repository/dating_data_repository.dart';
import 'package:dating/domain/repository/dating_repository.dart';
import 'package:dating/internal/dependencies/api_module.dart';

class RepositoryModule {
  static DatingRepository? _datingRepository;

  static DatingRepository datingRepository() {
    return _datingRepository ??= DatingDataRepository(ApiModule.apiUtil());
  }
}
