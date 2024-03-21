import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'instagram clone app'.toUpperCase(),  
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
