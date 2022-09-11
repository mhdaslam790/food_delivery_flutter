// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/domain/auth/auth_failure.dart';
import 'package:flutter_template/domain/auth/i_auth_facade.dart';
import 'package:flutter_template/domain/auth/user_model.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';
import 'package:flutter_template/domain/core/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  AuthFacade();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String email,
    required String name,
    required String mobileNumber,
    required String password,
  }) async {
    final jsonBody = {
      'name': name,
      'mobileNumber': mobileNumber,
      'emailId': email,
      'password': password,
      'userToken': ApiConstants.apiUserToken,
    };
    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.registerAPI,
    );
    final response = await http.post(url, body: jsonBody);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        // const storage = FlutterSecureStorage();

        // await storage.write(key: StorageConstants.isLoggedIn, value: "true");

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
  Future<Either<AuthFailure, UserModel>> signInWithMobileAndPassword({
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
      ApiConstants.apiURL + ApiConstants.logInAPI,
    );
    final response = await http.post(url, body: jsonBody);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        const storage = FlutterSecureStorage();
        await storage.write(key: StorageConstants.isLoggedIn, value: "true");

        final box = await Hive.openBox<UserModel>('UserBox');
        box.clear();
        final UserModel user =
            UserModel.fromMap(jsonResponse as Map<String, dynamic>);
        box.add(user);

        print(box.getAt(0)!.toMap());
        print('Info added to box!');
        // box.close();
        return right(user);
      } else {
        print("errpr");
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
    final box = await Hive.openBox<UserModel>('UserBox');

    box.clear();
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
  Future<Either<AuthFailure, Unit>> updateEmailAddress(
      {required String updatedEmail}) async {
    try {
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
      {required RestaurantModel data}) async {
    try {
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

  @override
  Future<Either<AuthFailure, Unit>> verifyOtp(
      {required String mobileNumber, required String otp}) async {
    final jsonBody = {
      'mobileNumber': mobileNumber,
      'otp': otp,
    };
    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.verifyOtpAPI,
    );
    final response = await http.post(url, body: jsonBody);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
        // const storage = FlutterSecureStorage();

        // await storage.write(key: StorageConstants.isLoggedIn, value: "true");

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
  Future<Either<AuthFailure, Unit>> sendOtp({
    required String mobileNumber,
  }) async {
    final jsonBody = {
      'mobileNumber': mobileNumber,
      // 'password': password,
      // 'userToken': ApiConstants.apiUserToken,
    };
    final url = Uri.parse(
      ApiConstants.apiURL + ApiConstants.sendOTPAPI,
    );
    final response = await http.post(url, body: jsonBody);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == '1') {
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
  Future<Either<AuthFailure, UserModel>> getSignedInUser() async {
    try {
      final box = await Hive.openBox<UserModel>('UserBox');

      if (box.getAt(0) != null) {
        print(box.getAt(0)!.toMap());
        return right(box.getAt(0)!);
      } else {
        return left(
          const AuthFailure.serverError(
            "No user found",
          ),
        );
      }
    } catch (e) {
      return left(
        const AuthFailure.serverError(
          "An unexpected error occurred while signing in. Please try again",
        ),
      );
    }
  }

  @override
  Future<Either<AuthFailure, String>> getUserLocationName() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final permi = await Geolocator.requestPermission();
        if (permi == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.

          Fluttertoast.showToast(
              msg:
                  "Enable location permission from setting. Meanwhile you can use our application with default location");
        } else {
          Fluttertoast.showToast(
              msg:
                  "Accessing location...");
        }
      }

      final position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 5));

      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      print(placemarks[0]);
      print("exe");
      return right(placemarks[0].street!);
    } catch (e) {
      print(e.toString());
      return right("");
    }
  }
}
