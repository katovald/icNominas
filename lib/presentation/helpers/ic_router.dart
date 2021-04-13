import 'package:flutter/material.dart';
import 'package:ic_nominas/presentation/helpers/pages.dart';
import 'package:ic_nominas/presentation/view/home_page.dart';
import 'package:ic_nominas/presentation/view/login_page.dart';

class ICRouter {
  final RouteObserver<PageRoute> routeObserver;

  ICRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name){
      case Pages.home:
        return _buildRoute(settings, HomePage());
      case Pages.login:
        return _buildRoute(settings, LoginPage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder){
    return new MaterialPageRoute(builder: (ctx) => builder, settings: settings);
  }
}