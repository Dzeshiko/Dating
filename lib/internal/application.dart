import 'package:dating/internal/providers/app_provider.dart';
import 'package:dating/internal/providers/home_provider.dart';
import 'package:dating/presentation/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Dating',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: const ColorScheme(
            primary: Color(0xFFFF56AA),
            secondary: Color(0xFF6BC1FF),
            surface: Color(0xFF1B1945),
            background: Color(0xFF0F0F2E),
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.white,
            onBackground: Color(0xFFF6993F),
            onError: Colors.white,
            brightness: Brightness.dark,
          ),
        ),
        routes: {
          '/': (context) => const HomeProvider(child: Home()),
        },
      ),
    );
  }
}
