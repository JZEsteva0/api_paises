import 'package:atvd_paises/view/initialPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      home: InitialPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}