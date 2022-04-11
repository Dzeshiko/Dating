import 'package:dating/domain/state/network/network_state.dart';
import 'package:dating/internal/dependencies/modules/network_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <Provider>[
        Provider<NetworkState>(
          create: (context) => NetworkModule.networkState(),
        )
      ],
      builder: (context, _) {
        NetworkState _networkState = Provider.of<NetworkState>(context);
        if (!_networkState.isRunning) _networkState.runNetworkListener();
        return child;
      },
    );
  }
}
