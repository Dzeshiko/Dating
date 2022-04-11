import 'package:dating/internal/application.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const List<Locale> locales = [Locale('ru', 'RU')];
  runApp(
    EasyLocalization(
      child: ScreenUtilInit(
        builder: () => const Application(),
      ),
      supportedLocales: locales,
      path: 'assets/translations',
      fallbackLocale: locales[0],
    ),
  );
}
