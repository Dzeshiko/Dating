import 'package:dating/domain/state/dating/dating_state.dart';
import 'package:dating/internal/dependencies/repository_module.dart';

class DatingModule {
  static DatingState datingState() {
    return DatingState(RepositoryModule.datingRepository());
  }
}
