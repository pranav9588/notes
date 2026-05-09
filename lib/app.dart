import 'package:flutter/material.dart';
import 'package:notes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Notes App',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}