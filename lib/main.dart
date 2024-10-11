// lib/main.dart

import 'package:flutter/material.dart';
import 'send_money_page.dart'; // Import the Send Money Page

void main() {
  runApp(MyApp()); // Run the application
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money App',
      theme: ThemeData(primarySwatch: Colors.blue), // Define the app theme
      home: SendMoneyPage(), // Set SendMoneyPage as the home page
    );
  }
}
