import 'package:flutter/material.dart';
import 'package:flick_tv/core/app_theme.dart';
import 'package:flick_tv/core/navigation/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router is used to integrate GoRouter with the application.
    return MaterialApp.router(
      title: 'OTT App Prototype',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      // The routerConfig is where all the navigation logic will be defined.
      routerConfig: AppRouter.router,
    );
  }
}