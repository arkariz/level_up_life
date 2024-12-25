import 'dart:async';

import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:level_up_life/data/base_service/interceptors/request_interceptor.dart';
import 'package:level_up_life/data/utility/data_dependecies_injection.dart';
import 'package:level_up_life/presentation/core/config/firebase_options.dart';
import 'package:level_up_life/presentation/core/config/dart_define_config.dart';
import 'package:level_up_life/presentation/core/generated/i18n/translations.g.dart';
import 'package:level_up_life/presentation/core/routes/app_pages.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/theme/app_theme.dart';
import 'package:level_up_life/presentation/core/widgets/fl_responsive/fl_responsive.dart';
import 'package:level_up_life/presentation/flavor/flavor.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      DataDependenciesInjection.inject();
      await Flavor.initialize(DartDefineConfig.environment);

      // Initialze Chukker Interceptor
      final dioRequestInspector = DioRequestInspector(
        isDebugMode: true,
        showFloating: false,
      );
      setRequestInspector(requestInspector: dioRequestInspector);

      final appWithInspector = DioRequestInspectorMain(inspector: dioRequestInspector, child: const MyApp());

      // Slang
      LocaleSettings.useDeviceLocale();
      final appWithSlang = TranslationProvider(child: appWithInspector);

      runApp(appWithSlang);
    }, 
    (error, stackTrace) {}
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      navigatorObservers: [
        DioRequestInspector.navigatorObserver,
      ],
      getPages: AppPages.routes,
      initialRoute: AppRoutes.example,
      builder: (context, child) {
        return FLResponsive(
          builder: (context, orientation, screenType) {
            return child!;
          }
        );
      }
    );
  }
}
