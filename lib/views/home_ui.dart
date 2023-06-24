// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar (
        backgroundColor: Colors.deepOrange,
        title: Text(
          'คำนวนค่างวดรถ'
        ),
      ),
    );
  }
}