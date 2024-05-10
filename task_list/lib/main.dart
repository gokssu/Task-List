import 'dart:async';

import 'package:task_list/providers/router_provider.dart';
import 'package:task_list/theme/theme.dart';
import 'package:task_list/utils/config.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    runApp(
      EasyLocalization(
        supportedLocales: Config.supportedLocales,
        path: 'assets/language',
        useOnlyLangCode: true,
        assetLoader: const YamlAssetLoader(),
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    );
  }, (error, stackTrace) {});
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: Config.appTitle,
      builder: (context, child) {
        return child ?? Container();
      },
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
