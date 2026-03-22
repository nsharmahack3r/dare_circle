import 'package:dare_circle/src/common/provider/common_providers.dart';
import 'package:dare_circle/src/features/auth/view/login_view.dart';
import 'package:dare_circle/src/features/auth/view/signup_view.dart';
import 'package:dare_circle/src/features/game/view/create_game_view.dart';
import 'package:dare_circle/src/features/home/view/home.dart';
import 'package:dare_circle/src/features/splash/view/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<String?>(authTokenProvider, (_, __) => notifyListeners());
  }
}

@riverpod
GoRouter router(Ref ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: SplashView.routePath,
    refreshListenable: notifier,
    redirect: (context, state) {
      final token = ref.read(authTokenProvider);
      final isAuth = token != null;

      final isSplash = state.matchedLocation == SplashView.routePath;
      final isLogin = state.matchedLocation == LoginView.routePath;
      final isSignup = state.matchedLocation == SignupView.routePath;

      if (isSplash) return null;

      if (!isAuth && !isLogin && !isSignup) {
        return LoginView.routePath;
      }

      if (isAuth && (isLogin || isSignup)) {
        return HomeView.routePath;
      }

      return null;
    },
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
      GoRoute(
        path: SignupView.routePath,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: LoginView.routePath,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
