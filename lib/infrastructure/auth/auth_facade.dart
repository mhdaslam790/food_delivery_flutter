// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/domain/auth/auth_failure.dart';
import 'package:flutter_template/domain/auth/i_auth_facade.dart';
import 'package:flutter_template/domain/auth/info_model.dart';
import 'package:flutter_template/domain/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  AuthFacade();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String mobileNumber,
    required String password,
  }) async {
    try {
      // await _firebaseAuth.createUserWithEmailAndPassword(
      //   email: emailAddress,
      //   password: password,
      // );
      return right(unit);
    } on Exception catch (e) {
      if (e == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(
          const AuthFailure.serverError(
            "An unexpected error occurred while signing in. Please try again",
          ),
        );
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithMobileAndPassword({
    required String mobileNumber,
    required String password,
  }) async {
    // try {
    final jsonBody = {
      'mobileNumber': mobileNumber,
      'password': password,
      'userToken': ApiConstants.apiUserToken,
    };
    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.logInUrl,
    );
    final response = await http.post(url, body: jsonBody);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        const storage = FlutterSecureStorage();

        await storage.write(key: StorageConstants.isLoggedIn, value: "true");

        return right(unit);
      } else {
        return left(
          AuthFailure.serverError(
            jsonResponse['message'].toString(),
          ),
        );
      }
    } else {
      return left(
        const AuthFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<void> signOut() async {
    const storage = FlutterSecureStorage();
    await storage.write(key: StorageConstants.isLoggedIn, value: "false");
  }

  @override
  Future<Either<AuthFailure, Unit>> resetPassword({
    required String emailAddress,
  }) async {
    try {
      // await _firebaseAuth.sendPasswordResetEmail(email: emailAddress);
      return right(unit);
    } on Exception catch (e) {
      // debugPrint(ode);
      if (e == 'user-not-found' || e == 'invalid-email') {
        return left(const AuthFailure.userNotFound());
      } else {
        return left(
          const AuthFailure.serverError(
            "Unexpected error occurred while sending password reset link. Please try again.",
          ),
        );
      }
    }
  }

  @override
  Future<bool> checkAuthState() async {
    const storage = FlutterSecureStorage();
    final value = await storage.read(key: StorageConstants.isLoggedIn);
    print("login status ${value.toString()}");
    if (value == null || value == "false") {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> deleteAccount() async {
    try {
      // final User? currentUser = _firebaseAuth.currentUser;
      //Delete user from firebase auth
      // await currentUser!.delete();
      //TODO: Delete documents for the users

      return right(unit);
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (e == "requires-recent-login") {
        return left(AuthFailure.serverError(e.toString()));
      }
      return left(const AuthFailure.deleteAccountFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updateEmailAddress(
      {required String updatedEmail}) async {
    try {
      // await _firebaseAuth.currentUser!.updateEmail(updatedEmail);
      return right(unit);
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (e == "email-already-in-use") {
        return left(const AuthFailure.emailAlreadyInUse());
      } else if (e == "requires-recent-login") {
        return left(AuthFailure.requiresRecentLogin(e.toString()));
      } else if (e == "invalid-email") {
        return left(
          const AuthFailure.serverError("Invalid email. Please enter again"),
        );
      } else {
        return left(AuthFailure.serverError(e.toString()));
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> insertData(
      {required InfoModel data}) async {
    try {
      // await _firebaseFirestore.userInfoCollection.add(data.toMap());
      return right(unit);
    } on Exception catch (e) {
      print(e.toString());
      return left(
        const AuthFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }
}
