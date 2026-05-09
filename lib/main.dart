import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app.dart';
import 'package:notes/features/auth/cubit/auth_cubit.dart';
import 'package:notes/features/auth/repository/auth_repository.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              context.read<AuthRepository>(),
            )..checkAuthStatus(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
