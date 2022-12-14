import 'dart:ui';

class AppConstants {
  static const String appName = "App-Name-Here";
  static const String appVersion = "1.0.0";
  static const String playStoreLink = "";
  static const String mailTo = "skilite007@gmail.com";
  static const String mailSubject = "This is the subject";
  static const String mailBody = "This is the mail body";
  static const String inviteText =
      "Hey! Download $appName I'm using it and It's a fast, simple and secure app. Get it at $playStoreLink";

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
  ];
  static const String dummyProfilePictureUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7MIK6s--5K3qB5E9AZ2uYAeIiBLJ9tTyRgPpl2V5V0CtKluyaa2TpINXGn4nqhWZ1Cco&usqp=CAU";
}

class StorageConstants {
  static const String themeMode = 'theme_mode';
  static const String appLocale = 'app_locale';
  static const String fingerPrintSupported = 'fingerpring_support';
  static const String fingerPrintEnabled = 'fingerpring_enable';
  static const String isLoggedIn = 'isLoggedIn';
}

class ApiConstants {
  // static const String apiKey = "";
  static const String apiUserToken = "123";
  static const String apiURL = "https://brbun.aaratechnologies.in/super_admin/";
  static const String logInAPI = "brbun_web_services/brbun_customer/login.php";
  static const String registerAPI =
      "brbun_web_services/brbun_customer/userRegistration.php";
  static const String sendOTPAPI =
      "brbun_web_services/brbun_customer/resendOtp.php";
  static const String verifyOtpAPI =
      "brbun_web_services/brbun_customer/verifyOtp.php";
  static const String sliderAPI =
      "brbun_web_services/brbun_customer/bannerSlider.php";
  static const String categoryAPI =
      "brbun_web_services/brbun_customer/restaurantCategory.php";
  static const String nearbyRestaurantAPI =
      "brbun_web_services/brbun_customer/nearbyRestaurants.php";
  static const String categorySearch =
      "brbun_web_services/brbun_customer/categoryWiseRestaurantsSearch.php";
  static const String searchAPI =
      "brbun_web_services/brbun_customer/search.php";
  static const String restaurantDetailAPI =
      "brbun_web_services/brbun_customer/restaurantsDetails.php";
  static const String categoryWiseMenuAPI =
      "brbun_web_services/brbun_customer/getCategoryWiseMenu.php";
}
