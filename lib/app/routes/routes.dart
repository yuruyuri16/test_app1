import 'package:go_router/go_router.dart';
import 'package:test_app/app/app.dart';
import 'package:test_app/counter/counter.dart';
import 'package:test_app/login/view/login_page.dart';
import 'package:test_app/register/view/register_page.dart';

GoRouter router(AuthCubit cubit) {
  return GoRouter(
    redirect: (state) {
      if (state.subloc == '/register') return null;
      final isAuthenticated = cubit.state.status.isAuthenticated;
      final isLoggedIn = state.subloc == '/login';

      if (!isAuthenticated && !isLoggedIn) return '/login';
      if (isAuthenticated && isLoggedIn) return '/';

      return null;
    },
    refreshListenable: GoRouterRefreshStream(cubit.stream),
    routes: <GoRoute>[
      GoRoute(path: '/', builder: (_, __) => const CounterPage()),
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),
    ],
    debugLogDiagnostics: true,
  );
}
