import 'package:cpn_app/pages/etv_page.dart';
import 'package:cpn_app/pages/home_page.dart';
import 'package:cpn_app/pages/imc_page.dart';
import 'package:cpn_app/pages/intro_page.dart';
import 'package:cpn_app/pages/login_page.dart';
import 'package:cpn_app/pages/primerTrimAct_page.dart';
import 'package:cpn_app/pages/segunTrimAct_page.dart';
import 'package:cpn_app/pages/tercerTrimAct_page.dart';
import 'package:cpn_app/widgets/EgEcoWidget.dart';
import 'package:cpn_app/widgets/EgFum.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'home': (_) => HomePage(),
  'fumwidget': (_) => EcoWidget(),
  'ecowidget': (_) => EgWidgetPage(),
  'primerTrim': (_) => PrimerTrimActPage(),
  'segundTrim': (_) => SegundTrimActPage(),
  'TercerTrim': (_) => TercerTrimActPage(),
  'intro': (_) => IntroPage(),
  'imc_page': (_) => ImcPage(),
  'ETV_page': (_) => ETVPage(),
};
