import 'package:event_hub/core/constants/routes.dart';
import 'package:event_hub/features/events/presentation/pages/events_screen.dart';
import 'package:event_hub/features/onboarding/presentation/pages/onboading_screen.dart';
import 'package:event_hub/features/search/presentation/pages/search_screen.dart';
import 'package:event_hub/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/signin_screen.dart';
import '../../features/auth/presentation/pages/signup_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _route(const SplashScreen());
      case Routes.onboarding:
        return _route(const OnboardingScreen());
      case Routes.signin:
        return _route(const SigninScreen());
      case Routes.signup:
        return _route(const SignupScreen());
      case Routes.home:
        return _route(const HomeScreen());
      case Routes.profile:
        return _route(const ProfileScreen());
      case Routes.search:
        return _route(const SearchScreen());
      case Routes.events:
        return _route(const EventsScreen());
      default:
        return _route(const Scaffold());
    }
  }

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
