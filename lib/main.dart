import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:flutter/material.dart';


// import 'package:disenos_app/src/pages/headers_page.dart';
// import 'package:disenos_app/src/pages/animaciones_page.dart';
// import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
// import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/pages/slideshow_page.dart';
// import 'package:disenos_app/src/pages/pinterest_page.dart';
// import 'package:disenos_app/src/pages/emergency_page.dart';

import 'package:disenos_app/src/pages/sliver_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage()
    );
  }
}