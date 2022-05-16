
import 'package:page_transition/page_transition.dart';
import 'package:yebox_interview/presentation/ui/base.dart';

import '../data/constants/route_constants.dart';

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