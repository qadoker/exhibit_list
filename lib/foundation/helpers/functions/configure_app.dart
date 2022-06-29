import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techincal_task/foundation/helpers/classes/app_bloc_observer.dart';
import 'package:techincal_task/foundation/helpers/functions/locator.dart';

Future<void> configureApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  Bloc.observer = AppBlocObserver();
}
