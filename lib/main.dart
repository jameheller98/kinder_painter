import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:master_source_flutter/src/common_providers/locale_controller.dart';
import 'package:master_source_flutter/src/common_widgets/common/layout.dart';
import 'package:master_source_flutter/src/config/app_config.dart';
import 'package:master_source_flutter/src/config/lang_config.dart';
import 'package:master_source_flutter/src/routing/router_controller.dart';
import 'package:master_source_flutter/src/config/database_config.dart';
import 'package:master_source_flutter/firebase_options.dart';

final theme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.robotoTextTheme(),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    Platform.isIOS
        ? DeviceOrientation.landscapeRight
        : DeviceOrientation.landscapeLeft
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dbConfig.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeControllerProvider);

    return Layout(
        child: MaterialApp.router(
      title: AppConfig.appName,
      theme: theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: LangConfig.supportedLocales(),
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (AppLocalizations.delegate.isSupported(deviceLocale!)) {
          return deviceLocale;
        }

        return const Locale('en');
      },
      routerConfig: routerController,
    ));
  }
}
