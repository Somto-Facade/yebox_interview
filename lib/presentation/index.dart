// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:yebox_interview/presentation/router.dart';

import '../data/constants/route_constants.dart';
import '../data/services/navigation.dart';
import '../di/get_it.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(),
        ),
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
      navigatorKey: getItInstance<NavigationServiceImpl>().navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Yebox Interview',
      initialRoute: Routes.init,
      onGenerateRoute: (settings) => CustomRouter.generateRoutes(settings),
    );
  }
}
