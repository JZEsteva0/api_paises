import 'package:atvd_paises/view/appPage.dart';
import 'package:atvd_paises/view/registerPersonPage.dart';
import 'package:atvd_paises/view/initialPage.dart';
import 'package:flutter/widgets.dart';

class AppRoutes{
  static const appPage = '/appPage';
  static const initialPage = '/initialPage';
  static const registerPersonPage = '/registerPersonPage';

  Map<String, WidgetBuilder> define(){
    return{
      appPage: (BuildContext context) => AppPage(),
      initialPage: (BuildContext context) => InitialPage(),
      registerPersonPage: (BuildContext context) => RegisterPersonPage(),
    };
  }
}