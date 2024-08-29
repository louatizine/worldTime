import 'package:flutter/material.dart';
import 'package:worldtime/screens/loading.dart';
import 'package:worldtime/screens/Home.dart';
import 'package:worldtime/screens/choose_location';


void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }
));