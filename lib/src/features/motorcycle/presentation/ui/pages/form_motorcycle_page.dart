import 'package:flutter/material.dart';

import '../organisms/add_motorcycle.dart';

class FormMotorcyclePage extends StatelessWidget {
  const FormMotorcyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Agregar una moto'),
      ),
      body: AddMotorcycle(),
    );
  }
}
