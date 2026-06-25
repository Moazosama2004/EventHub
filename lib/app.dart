import 'package:event_hub/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

class EventHubApp extends StatelessWidget {
  const EventHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF8F7FF),
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
