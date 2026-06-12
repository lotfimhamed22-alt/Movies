import 'package:go_router/go_router.dart';
import 'package:movies/features/auth/view/presentations/login_page.dart';
import 'package:movies/features/splash/splash_logic.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(path: "/splash", builder: (context, state) => SplashLogic()),
      GoRoute(path: "/login", builder: (context, state) => LoginPage()),
    ],
  );
}
