import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/services/auth_services.dart';
import 'package:movies/features/splash/splash_ui.dart';

class SplashLogic extends StatefulWidget {
  const SplashLogic({super.key});

  @override
  State<SplashLogic> createState() => _SplashLogicState();
}

class _SplashLogicState extends State<SplashLogic> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final user = authServices.value.currentUser;

    if (user != null) {
      context.go(RoutesConstants.bottomNavigationPath);
    } else {
      context.go(RoutesConstants.loginPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashUi();
  }
}
