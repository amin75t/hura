import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Flutter Dio + GetX Example',
    initialRoute: '/',
    getPages: AppRoutes.routes,
  ));
}
