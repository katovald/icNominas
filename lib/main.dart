import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ic_nominas/presentation/helpers/ic_router.dart';
import 'package:ic_nominas/presentation/view/animation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final ICRouter _router;

  MyApp() : _router = ICRouter();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Nominas Inter-Con',
      theme: ThemeData(
      ),
      home: AnimationPage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
}
