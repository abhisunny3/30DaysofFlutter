import 'package:flutter/material.dart';
import 'package:tests/core/store.dart';
import 'package:tests/pages/cart_page.dart';
import 'package:tests/pages/home_page.dart';
import 'package:tests/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tests/utils/routes.dart';
import 'package:tests/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int days = 30;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRote,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRote: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
