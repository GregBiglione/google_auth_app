import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_auth_app/domain/usecase/auth/auth_usecase.dart';

import '../../../domain/utils/state_render.dart';

class SignInViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<StateRender> _responseController = StreamController();

  SignInViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  Stream<StateRender> get response => _responseController.stream;

  // ---------------------------------------------------------------------------
  // Google sign in
  // ---------------------------------------------------------------------------

  void googleSignIn() async {
    _responseController.add(Init());
    // Loading -----------------------------------------------------------------
    _responseController.add(Loading());
    // Sign in -----------------------------------------------------------------
    final data = await _authUseCase.googleSignInUseCase.launch();
    _responseController.add(data);
  }
}