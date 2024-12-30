import 'package:fire_walker/router/entry_point.dart';
import 'package:go_router/go_router.dart';

import '../presentation/onboarding_page/onboarding_view.dart';
import '../presentation/sign_in_page/sign_in_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/sign',
  routes: [
    GoRoute(
      path: '/sign',
      builder: (context, state) =>  const SignInView(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: '/entry',
      builder: (context, state) => const EntryPoint(),
    ),
  ],
);
