import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/welcome_page.dart';
import 'screens/login_page.dart'; 
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Chemical Distributor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(), // First screen (Welcome Page)
    );
  }
}
