import 'package:flutter/material.dart';
import 'package:news_app_new/controller/homescreen_controller.dart';
import 'package:news_app_new/view/bottonnavscreen/bottonnavscreen.dart';
import 'package:news_app_new/view/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bottomnavigationscreen(),
      ),
    );
  }
}
