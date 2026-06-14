import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/features/splash/splash_ui.dart';

class SplashLogic extends StatefulWidget {
  const SplashLogic({super.key});

  @override
  State<SplashLogic> createState() => _SplashLogicState();
}

class _SplashLogicState extends State<SplashLogic> {
  @override
  void initState() {
    navigateToSplash();
    super.initState();
  }

  // navigate to splash
  Future<void> navigateToSplash() async {
    await Future.delayed(Duration(seconds: 5));
    if (!mounted) return;
    context.push(RoutesConstants.loginPath);
  }

  @override
  void dispose() {
    navigateToSplash();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashUi();
  }
}
