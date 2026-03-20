import 'package:dare_circle/src/features/game/view/create_game_view.dart';
import 'package:dare_circle/src/features/home/view/home.dart';
import 'package:dare_circle/src/features/splash/view/splash_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SplashView.routePath,
  routes: [
    GoRoute(
      path: SplashView.routePath,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: HomeView.routePath,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: CreateGameView.routePath,
      builder: (context, state) => const CreateGameView(),
    ),
  ],
);
