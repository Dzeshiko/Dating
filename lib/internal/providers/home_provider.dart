import 'package:another_flushbar/flushbar.dart';
import 'package:dating/domain/state/dating/dating_state.dart';
import 'package:dating/domain/state/network/network_state.dart';
import 'package:dating/internal/dependencies/modules/dating_module.dart';
import 'package:dating/widgets/messages.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  final Widget child;
  const HomeProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <Provider>[
        Provider<DatingState>(
          create: (_) => DatingModule.datingState(),
        ),
      ],
      child: child,
      builder: (context, _) {
        NetworkState _networkState = Provider.of<NetworkState>(context);

        Flushbar? _flushbar;

        WidgetsBinding.instance!.addPostFrameCallback((_) {
          autorun(
            (_) {
              if (!_networkState.isConnection) {
                if (_flushbar != null && _flushbar!.isShowing()) _flushbar?.dismiss();
                _flushbar = showWarningProgressMessage(
                  'Ожидание соединения...',
                  context,
                );
              } else {
                if (_flushbar != null && _flushbar!.isShowing()) _flushbar?.dismiss();
              }
            },
          );
        });
        return child;
      },
    );
  }
}
