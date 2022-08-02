import 'package:aj_news/homeView_folder/homeView/homeView.dart';
import 'package:flutter/material.dart';

void main () => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AjiriNews',
      //debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}