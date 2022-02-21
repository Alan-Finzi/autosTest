import 'package:auto_test_app/pages/start_page.dart';
import 'package:auto_test_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  String _initialRoute = StartPage.routeName;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(CardServiceApp(initialRoute: _initialRoute,key: const Key('runApp'),));
  });
}



class CardServiceApp extends StatelessWidget {
  final String initialRoute;
  const CardServiceApp({required Key key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.black,));
    return  MaterialApp(
      theme: _themeData(),
      initialRoute: initialRoute,
      color: Colors.black,

      debugShowCheckedModeBanner: false,
      routes: ApplicationRoutes.getApplicationRoutes(),
    );
  }
  ThemeData _themeData() {
    return ThemeData(
        primaryColor: Colors.blue,
        backgroundColor: Colors.blue,
        fontFamily: "ComicSans",
        visualDensity: VisualDensity.adaptivePlatformDensity
    );
  }
}