import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mobx/mobx.dart';

part 'network_state.g.dart';

class NetworkState = NetworkStateBase with _$NetworkState;

abstract class NetworkStateBase with Store {
  @observable
  bool isConnection = false;

  @observable
  bool isRunning = false;

  late StreamSubscription _streamSubscription;

  @action
  void runNetworkListener() {
    _streamSubscription = DataConnectionChecker().onStatusChange.listen((event) {
      if (DataConnectionStatus.disconnected == event) {
        isConnection = false;
      } else {
        isConnection = true;
      }
    });
    isRunning = true;
  }

  @action
  void stopNetworkListener() {
    _streamSubscription.cancel();
    isRunning = false;
  }
}
