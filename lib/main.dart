import 'package:flutter/material.dart';
import 'package:login_page_cubit/screens/login/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginView(),
    );
  }
}