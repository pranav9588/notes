import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/features/auth/views/login_screen.dart';
import 'package:notes/features/auth/views/splash.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      // GoRoute(
      //   path: '/signup',
      //   builder: (context, state) => const SignupScreen(),
      // ),
      // GoRoute(
      //   path: '/notes',
      //   builder: (context, state) => const NotesScreen(),
      // ),
    ],
  );
}