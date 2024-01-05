import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class VelocidadePage extends StatefulWidget {
  @override
  _VelocidadePageState createState() => _VelocidadePageState();
}

class _VelocidadePageState extends State<VelocidadePage> {
  double velocidadeDownload = 0.0;
  double velocidadeUpload = 0.0;

  @override
  void initState() {
    super.initState();
    _simularTesteVelocidade();
  }

  Future<void> _simularTesteVelocidade() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();
    velocidadeDownload = random.nextDouble() * 100;
    velocidadeUpload = random.nextDouble() * 100;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de Velocidade'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
           colors: [Colors.lightBlueAccent, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpeedIndicator(
                label: 'Download',
                speed: velocidadeDownload,
              ),
              SizedBox(height: 20),
              SpeedIndicator(
                label: 'Upload',
                speed: velocidadeUpload,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeedIndicator extends StatelessWidget {
  final String label;
  final double speed;

  const SpeedIndicator({
    required this.label,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$label: ${speed.toStringAsFixed(2)} Mbps',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 10),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [Colors.blue, Colors.transparent],
            ),
          ),
          child: Center(
            child: Text(
              speed.toStringAsFixed(1),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
