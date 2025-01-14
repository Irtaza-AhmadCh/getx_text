import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pro/resources/routes/page_routes.dart';
import 'package:getx_pro/resources/routes/route_name.dart';

import 'firebase_options.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:RouteName.signScreen,
      getPages: PageRoutes.route(),
    );
  }
}
