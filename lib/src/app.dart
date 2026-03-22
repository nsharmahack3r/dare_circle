import 'package:dare_circle/src/resources/app_theme.dart';
import 'package:dare_circle/src/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerCfg = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Dare Circle',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: routerCfg,
    );
  }
}
