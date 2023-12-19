import 'package:flutter/material.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart',style: TextStyle(
          fontFamily: 'Roboto'
        ),),
      ),
    );
  }
}
