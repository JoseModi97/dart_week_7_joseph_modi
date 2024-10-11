// lib/send_money_page.dart

import 'package:flutter/material.dart';
import 'custom_button.dart'; // Import the Custom Button

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>(); // Form key to validate
  String? recipientName; // Variable to store recipient name
  double? amount; // Variable to store amount
  String? paymentMethod; // Variable for payment method
  bool isFavorite = false; // Variable for favorite status
  bool _showSuccessMessage = false; // State for showing success message

  // List of payment methods
  List<String> paymentMethods = [
    'Bank Transfer',
    'Mobile Money',
    'Credit Card'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')), // App bar with title
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the form
        child: Form(
          key: _formKey, // Set the form key for validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TextField for Recipient's Name
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the recipient\'s name';
                  }
                  return null;
                },
                onSaved: (value) {
                  recipientName = value; // Save recipient name
                },
              ),
              // TextField for Amount
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number, // Number input type
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Please enter a positive number';
                  }
                  return null; // No error
                },
                onSaved: (value) {
                  amount = double.tryParse(value!); // Save amount
                },
              ),
              // DropdownButton for Payment Method
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Payment Method'),
                value: paymentMethod,
                items: paymentMethods.map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method), // Display payment methods
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    paymentMethod = newValue; // Update payment method
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a payment method' : null,
              ),
              // Switch for Favorite Transaction
              SwitchListTile(
                title: Text('Mark as Favorite'),
                value: isFavorite,
                onChanged: (bool value) {
                  setState(() {
                    isFavorite = value; // Update favorite status
                  });
                },
              ),
              SizedBox(height: 20), // Space before the button
              // Custom Button
              CustomButton(
                label: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save(); // Save form data
                    setState(() {
                      _showSuccessMessage = true; // Show the message
                    });
                  }
                },
              ),
              // Animated success message
              AnimatedOpacity(
                opacity: _showSuccessMessage ? 1.0 : 0.0,
                duration: Duration(seconds: 1), // Duration of the animation
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.green,
                  child: Text(
                    'Transaction Successful!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
