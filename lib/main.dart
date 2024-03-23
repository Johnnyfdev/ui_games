import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets/buttons/3d_button.dart';
import 'widgets/loading/bar_3d_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _percent = 0.1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GameBar3DIndicator(
              height: 60,
              percent: _percent,
              barColor: const Color(0xff76C23B),
              backgroundColor: const Color(0xffB49B97),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Game3DButton.text(
            text: 'Button 1',
            color: const Color(0xff76C23B),
            shadowColor: const Color.fromARGB(255, 76, 130, 35),
            onPressed: () {
              setState(() {
                _percent = Random().nextDouble().clamp(0.0, 1.0);
              });
            },
          ),
        ),
      ),
    );
  }
}
