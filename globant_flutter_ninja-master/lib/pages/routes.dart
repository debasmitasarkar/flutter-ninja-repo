import 'package:flutter/material.dart';
import './login_screen.dart';
import './categories_screen.dart';
import './my_home_page.dart';
import './job_list_page.dart';
import './user_profile_screen.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
}

class Routes {
  static builder() {
    return (RouteSettings settings) {
      switch (settings.name) {
        case '/':
          return SlideRightRoute(widget: LoginScreen());
          break;
        case '/login':
          return SlideRightRoute(widget: LoginScreen());
          break;
        case '/category':
          return SlideRightRoute(widget: CategoriesScreen());
          break;
        case '/home':
          return SlideRightRoute(widget: MyHomePage());
          break;
        case '/joblist':
          return SlideRightRoute(widget: JobListPage());
          break;
        case '/profile':
          return SlideRightRoute(widget: UserProfileScreen());
          break;
      }
    };
  }
}
