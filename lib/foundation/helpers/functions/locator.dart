import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:techincal_task/foundation/data_sources/remote/exhibit_list/rest_exhibit_list_loader.dart';

final getIt = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();
final ctx = navigatorKey.currentContext;

void setupLocator() {
  getIt.registerLazySingleton(() => RestExhibitsLoader());
}
