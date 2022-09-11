import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/auth/auth_failure.dart';
import 'package:flutter_template/domain/auth/i_auth_facade.dart';
import 'package:flutter_template/domain/auth/user_model.dart';
import 'package:flutter_template/domain/restaurant/restaurant_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      getSignedInUser: (e) async* {
        final opt = await _authFacade.getSignedInUser();
        yield opt.fold(
          (failure) => state.copyWith(
            authFailureOrSuccessOption: none(),
            emailSendFailureOrSuccessOption: none(),
            deleteAccountFailureOrSuccessOption: none(),
            updateEmailFailureOrSuccessOption: none(),
          ),
          (r) => state.copyWith(
            signedInUser: r,
            authFailureOrSuccessOption: none(),
            emailSendFailureOrSuccessOption: none(),
            deleteAccountFailureOrSuccessOption: none(),
            updateEmailFailureOrSuccessOption: none(),
          ),
        );
      },
      registerWithEmailAndPassword: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
          emailSendFailureOrSuccessOption: none(),
          deleteAccountFailureOrSuccessOption: none(),
          updateEmailFailureOrSuccessOption: none(),
        );

        final opt = await _authFacade.registerWithEmailAndPassword(
          email: e.email,
          password: e.password,
          name: e.name,
          mobileNumber: e.mobileNumber,
        );

        yield state.copyWith(
          isLoading: false,
          isUserSignedin: opt.fold(
            (failure) => false,
            (success) => true,
          ),
          authFailureOrSuccessOption: optionOf(opt),
          emailSendFailureOrSuccessOption: none(),
          deleteAccountFailureOrSuccessOption: none(),
          updateEmailFailureOrSuccessOption: none(),
        );
      },
      signInWithEmailAndPassword: (e) async* {
        final opt = await _authFacade.signInWithMobileAndPassword(
            mobileNumber: e.mobileNumber, password: e.password);
        yield opt.fold(
            (failure) => state.copyWith(
                  authFailureOrSuccessOption: some(left(failure)),
                  emailSendFailureOrSuccessOption: none(),
                  deleteAccountFailureOrSuccessOption: none(),
                  updateEmailFailureOrSuccessOption: none(),
                  otpVerifyFailureOrSuccessOption: none(),
                ), (r) {
          print(r.toMap());
          return state.copyWith(
            signedInUser: r,
            authFailureOrSuccessOption: some(right(unit)),
            emailSendFailureOrSuccessOption: none(),
            deleteAccountFailureOrSuccessOption: none(),
            updateEmailFailureOrSuccessOption: none(),
            otpVerifyFailureOrSuccessOption: none(),
          );
        });
      },
      verifyOtp: (e) async* {
        yield state.copyWith(
          isLoading: true,
          deleteAccountFailureOrSuccessOption: none(),
          updateEmailFailureOrSuccessOption: none(),
          authFailureOrSuccessOption: none(),
          emailSendFailureOrSuccessOption: none(),
        );
        final failureOrSuccess = await _authFacade.verifyOtp(
          mobileNumber: e.mobileNumber,
          otp: e.otp,
        );
        yield state.copyWith(
          isLoading: false,
          otpVerifyFailureOrSuccessOption: optionOf(failureOrSuccess),
          deleteAccountFailureOrSuccessOption: none(),
          updateEmailFailureOrSuccessOption: none(),
          authFailureOrSuccessOption: none(),
        );
      },
      signOut: (e) async* {
        await _authFacade.signOut();
        yield state.copyWith(
          isUserSignedin: false,
          deleteAccountFailureOrSuccessOption: none(),
          updateEmailFailureOrSuccessOption: none(),
          authFailureOrSuccessOption: none(),
          emailSendFailureOrSuccessOption: none(),
        );
      },
      checkAuthState: (e) async* {
        yield state.copyWith(
          isUserSignedin: false,
        );
        final bool isUserSignedIn = await _authFacade.checkAuthState();
        yield state.copyWith(
          isUserSignedin: isUserSignedIn,
        );
      },
      sendOtp: (e) async* {
        yield state.copyWith(
          isLoading: false,
          deleteAccountFailureOrSuccessOption: none(),
          updateEmailFailureOrSuccessOption: none(),
          authFailureOrSuccessOption: none(),
          emailSendFailureOrSuccessOption: none(),
          otpVerifyFailureOrSuccessOption: none(),
        );
        final failureOrSuccess =
            await _authFacade.sendOtp(mobileNumber: e.mobileNumber);
      },
      updateEmailAddress: (e) async* {
        yield state.copyWith(
          isLoading: true,
          deleteAccountFailureOrSuccessOption: none(),
          updateEmailFailureOrSuccessOption: none(),
          authFailureOrSuccessOption: none(),
          emailSendFailureOrSuccessOption: none(),
        );
        final opt =
            await _authFacade.updateEmailAddress(updatedEmail: e.updatedEmail);
        yield opt.fold(
          (l) => state.copyWith(
            isLoading: false,
            deleteAccountFailureOrSuccessOption: none(),
            updateEmailFailureOrSuccessOption: some(left(l)),
            authFailureOrSuccessOption: none(),
            emailSendFailureOrSuccessOption: none(),
          ),
          (r) => state.copyWith(
            isLoading: false,
            deleteAccountFailureOrSuccessOption: none(),
            updateEmailFailureOrSuccessOption: some(right(unit)),
            authFailureOrSuccessOption: none(),
            emailSendFailureOrSuccessOption: none(),
          ),
        );
      },
      updateConnectivityStatus: (e) async* {
        log("Updated connectivity status: ${e.status}");
        bool isNetworkAvailable = true;
        if (e.status == ConnectivityResult.none) {
          isNetworkAvailable = false;
        }
        yield state.copyWith(
          isNetworkAvailable: isNetworkAvailable,
        );
      },
      checkConnectivityStatus: (e) async* {
        bool isNetworkAvailable = true;
        final ConnectivityResult connectivityStatus =
            await Connectivity().checkConnectivity();
        log("Current connectivity status: $connectivityStatus");
        if (connectivityStatus == ConnectivityResult.none) {
          isNetworkAvailable = false;
        }
        yield state.copyWith(
          isNetworkAvailable: isNetworkAvailable,
        );
      },
      addData: (e) async* {
        final opt = await _authFacade.insertData(data: e.data);
      },
      changeSortByOrder: (e) async* {
        yield state.copyWith(
          orderBy: e.orderBy,
        );
      },
      getUserLocationName: (e) async* {
        final opt = await _authFacade.getUserLocationName();

        yield opt.fold(
            (l) => state.copyWith(), (r) => state.copyWith(street: r));
        // yield state.copyWith(
        //   street: opt ,
        // );
      },
    );
  }

  Stream<AuthState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required String mobileNumber,
      required String password,
    })
        forwardedCall,
    String email,
    String password,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    yield state.copyWith(
      isLoading: true,
      authFailureOrSuccessOption: none(),
      emailSendFailureOrSuccessOption: none(),
      deleteAccountFailureOrSuccessOption: none(),
      updateEmailFailureOrSuccessOption: none(),
    );

    failureOrSuccess = await forwardedCall(
      mobileNumber: email,
      password: password,
    );

    yield state.copyWith(
      isLoading: false,
      isUserSignedin: failureOrSuccess.fold(
        (failure) => false,
        (success) => true,
      ),
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
      emailSendFailureOrSuccessOption: none(),
      deleteAccountFailureOrSuccessOption: none(),
      updateEmailFailureOrSuccessOption: none(),
    );
  }
}
