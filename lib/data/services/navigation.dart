import 'package:flutter/material.dart';

abstract class NavigationService {
  Future<dynamic> navigateTo(String routeName, {dynamic arguments});
  Future<dynamic> replaceWith(String routeName, {dynamic arguments});
  void pop();
  Future<dynamic> replaceUntil(
      {required String routeName,
        required String lastRouteName,
        dynamic arguments});
}

class NavigationServiceImpl extends NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  @override
  void pop() {
    return _navigationKey.currentState!.pop();
  }

  @override
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> replaceWith(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future replaceUntil(
      {required String routeName,
        required String lastRouteName,
        dynamic arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        lastRouteName, ModalRoute.withName(routeName),
        arguments: arguments);
  }
}
