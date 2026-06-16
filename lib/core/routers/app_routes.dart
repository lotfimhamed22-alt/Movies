import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/features/auth/presentations/view/screens/forgetpass.dart';
import 'package:movies/features/auth/presentations/view/screens/login_page.dart';
import 'package:movies/features/auth/presentations/view/screens/signup_page.dart';
import 'package:movies/features/auth/presentations/view_model/forgetpass/cubit/forget_pass_cubit.dart';
import 'package:movies/features/auth/presentations/view_model/signin/cubit/signin_cubit.dart';
import 'package:movies/features/auth/presentations/view_model/signup/signup_cubit.dart';
import 'package:movies/features/details/presentation/view/screens/details_screen.dart';
import 'package:movies/features/details/presentation/view_model/cast/cubit/cast_cubit.dart';
import 'package:movies/features/details/presentation/view_model/review/cubit/review_cubit.dart';
import 'package:movies/features/home/data/models/movie_model.dart';
import 'package:movies/features/home/presentation/view/screens/home_page.dart';
import 'package:movies/features/splash/splash_logic.dart';
import 'package:movies/main_layout_screen.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: RoutesConstants.bottomNavigationPath,
    routes: [
      GoRoute(
        path: RoutesConstants.splash,
        builder: (context, state) => SplashLogic(),
      ),
      GoRoute(
        path: RoutesConstants.loginPath,
        builder: (context, state) => BlocProvider(
          create: (context) => SigninCubit(),
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: RoutesConstants.signupPath,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(),
          child: SignupPage(),
        ),
      ),
      GoRoute(
        path: RoutesConstants.forgetPasswordPath,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPassCubit(),
          child: Forgetpass(),
        ),
      ),
      GoRoute(
        path: RoutesConstants.homePath,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: RoutesConstants.bottomNavigationPath,
        builder: (context, state) => MainLayoutScreen(),
      ),
      GoRoute(
        path: RoutesConstants.detailsPath,

        builder: (context, state) {
          final movie = state.extra as MovieModel;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ReviewCubit()),
              BlocProvider(create: (context) => CastCubit()),
            ],
            child: DetailsScreen(data: movie),
          );
        },
      ),
    ],
  );
}
