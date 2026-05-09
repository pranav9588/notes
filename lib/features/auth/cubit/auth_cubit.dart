import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/auth/repository/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  StreamSubscription? _authSubscription;

  AuthCubit(this._authRepository) : super(AuthInitial());

  void checkAuthStatus() {
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      if (user != null) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      await _authRepository.signUp(
        email: email,
        password: password,
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      await _authRepository.login(
        email: email,
        password: password,
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());

      await _authRepository.logout();
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}