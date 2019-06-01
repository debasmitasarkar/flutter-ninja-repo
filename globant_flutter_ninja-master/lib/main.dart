import 'package:flutter/material.dart';
import 'package:globant_flutter_ninja/theme.dart';
import 'package:globant_flutter_ninja/pages/login_screen.dart';
import 'package:globant_flutter_ninja/pages/my_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './pages/auth.dart';
import 'package:globant_flutter_ninja/pages/user_profile_screen.dart';
import './pages/routes.dart';

void main() => runApp(MyApp());
final Auth auth = Auth();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: '/',
        onGenerateRoute: Routes.builder());
  }
}
