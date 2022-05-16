
import 'package:page_transition/page_transition.dart';

import '../data/constants/route_constants.dart';
import 'Base/index.dart';

class CustomRouter {
  CustomRouter._();
  static generateRoutes(settings) {
    switch (settings.name) {
      case Routes.init:
        return PageTransition(
            child: const Base(),
            type: PageTransitionType.fade,
            settings: settings);
    }
  }
}