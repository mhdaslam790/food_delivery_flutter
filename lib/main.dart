import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/auth/user_model.dart';
import 'package:flutter_template/injection.dart';
import 'package:flutter_template/presentation/core/app_widget.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await _initializeCrashlytics();
      final directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path);
      Hive.registerAdapter(UserModelAdapter());

      configureInjection(Environment.prod);
      runApp(AppWidget());
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}

Future<void> _initializeCrashlytics() async {
  if (!kIsWeb) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}
