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
      final loggingIn = state.subloc == '/login';

      if (!isAuthenticated && !loggingIn) return '/login';
      if (isAuthenticated && loggingIn) return '/';

      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      cubit.stream.map((event) => event.status).distinct(),
    ),
    routes: <GoRoute>[
      GoRoute(path: '/', builder: (_, __) => const CounterPage()),
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),
    ],
    debugLogDiagnostics: true,
  );
}
