import 'package:dartz/dartz.dart';
import 'package:flutter_template/domain/auth/auth_failure.dart';
import 'package:flutter_template/domain/auth/user_model.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String email,
    required String name,
    required String mobileNumber,
    required String password,
  });
  Future<Either<AuthFailure, UserModel>> signInWithMobileAndPassword({
    required String mobileNumber,
    required String password,
  });
  Future<void> signOut();
  Future<bool> checkAuthState();

  Future<Either<AuthFailure, Unit>> sendOtp({
    required String mobileNumber,
  });
  Future<Either<AuthFailure, Unit>> updateEmailAddress({
    required String updatedEmail,
  });

  Future<Either<AuthFailure, Unit>> verifyOtp({
    required String mobileNumber,
    required String otp,
  });
  Future<Either<AuthFailure, Unit>> insertData({required RestaurantModel data});
  Future<Either<AuthFailure, UserModel>> getSignedInUser();
  Future<Either<AuthFailure, String>> getUserLocationName();
}
