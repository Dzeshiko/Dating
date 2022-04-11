// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NetworkState on NetworkStateBase, Store {
  final _$isConnectionAtom = Atom(name: 'NetworkStateBase.isConnection');

  @override
  bool get isConnection {
    _$isConnectionAtom.reportRead();
    return super.isConnection;
  }

  @override
  set isConnection(bool value) {
    _$isConnectionAtom.reportWrite(value, super.isConnection, () {
      super.isConnection = value;
    });
  }

  final _$isRunningAtom = Atom(name: 'NetworkStateBase.isRunning');

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  final _$NetworkStateBaseActionController =
      ActionController(name: 'NetworkStateBase');

  @override
  void runNetworkListener() {
    final _$actionInfo = _$NetworkStateBaseActionController.startAction(
        name: 'NetworkStateBase.runNetworkListener');
    try {
      return super.runNetworkListener();
    } finally {
      _$NetworkStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopNetworkListener() {
    final _$actionInfo = _$NetworkStateBaseActionController.startAction(
        name: 'NetworkStateBase.stopNetworkListener');
    try {
      return super.stopNetworkListener();
    } finally {
      _$NetworkStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConnection: ${isConnection},
isRunning: ${isRunning}
    ''';
  }
}
