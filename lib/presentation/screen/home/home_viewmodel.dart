import 'package:flutter/material.dart';
import 'package:google_auth_app/domain/usecase/auth/auth_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;

  HomeViewModel(this._authUseCase);

  // ---------------------------------------------------------------------------
  // Google logout
  // ---------------------------------------------------------------------------

  void googleLogOut() async {
    await _authUseCase.googleLogOutUseCase.launch();
  }
}