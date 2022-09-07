import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_template/domain/auth/auth_failure.dart';
import 'package:flutter_template/domain/auth/info_model.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<void> signOut();
  Future<bool> checkAuthState();

  Future<Either<AuthFailure, Unit>> deleteAccount();
  Future<Either<AuthFailure, Unit>> updateEmailAddress({
    required String updatedEmail,
  });

  Future<Either<AuthFailure, Unit>> resetPassword({
    required String emailAddress,
  });
  Future<Either<AuthFailure, Unit>> insertData({required InfoModel data});
}
