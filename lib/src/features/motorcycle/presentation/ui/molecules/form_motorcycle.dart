import 'package:flutter/material.dart';

import '../atoms/input.dart';

class FormMotorcycle extends StatelessWidget {
  final GlobalKey formKey;
  final TextEditingController? nameController;
  final TextEditingController? brandController;
  final TextEditingController? modelController;
  final TextEditingController? cylinderCapacityController;
  const FormMotorcycle({
    Key? key,
    required this.formKey,
    this.nameController,
    this.brandController,
    this.modelController,
    this.cylinderCapacityController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputAtom(
            controller: nameController,
            hintText: 'Digite Nombre',
            labelText: 'Nombre',
          ),
          const SizedBox(height: 15.0),
          InputAtom(
            controller: brandController,
            hintText: 'Digite Marca',
            labelText: 'Marca',
          ),
          const SizedBox(height: 15.0),
          InputAtom(
            controller: modelController,
            hintText: 'Digite Modelo',
            labelText: 'Modelo',
          ),
          const SizedBox(height: 15.0),
          InputAtom(
            controller: cylinderCapacityController,
            hintText: 'Digite Cilindraje',
            labelText: 'Cilindraje',
          ),
        ],
      ),
    );
  }
}
