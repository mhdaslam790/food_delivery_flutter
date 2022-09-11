part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.registerWithEmailAndPassword({
    required String email,
    required String name,
    required String mobileNumber,
    required String password,
  }) = _RegisterWithEmailAndPassword;

  const factory AuthEvent.signInWithEmailAndPassword({
    required String mobileNumber,
    required String password,
  }) = _SignInWithEmailAndPassword;

  const factory AuthEvent.signOut() = SignOut;

  const factory AuthEvent.checkAuthState() = CheckAuthState;

  const factory AuthEvent.verifyOtp(
      {required String mobileNumber,
      required String otp}) = _SendEmailConfirmation;

  const factory AuthEvent.sendOtp({required String mobileNumber}) =
      _DeleteAccount;
  const factory AuthEvent.updateEmailAddress(String updatedEmail) =
      _UpdateEmailAddress;
  const factory AuthEvent.updateConnectivityStatus(ConnectivityResult status) =
      _UpdateConnectivityStatus;
  const factory AuthEvent.checkConnectivityStatus() = _CheckConnectivityStatus;
  const factory AuthEvent.getSignedInUser() = _GetSignedInUser;
  const factory AuthEvent.addData({required RestaurantModel data}) = _AddData;
  const factory AuthEvent.changeSortByOrder({required String orderBy}) =
      _changeSortByOrder;
  const factory AuthEvent.getUserLocationName() = _GetUserLocationName;
}
