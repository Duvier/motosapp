import 'package:flutter/material.dart';
import 'package:motosapp/src/shared/utils/validations.dart';

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
            validator: (value) => validateInputRequired(value, 'nombre'),
            labelText: 'Nombre',
          ),
          const SizedBox(height: 15.0),
          InputAtom(
            controller: brandController,
            validator: (value) => validateInputRequired(value, 'marca'),
            hintText: 'Digite Marca',
            labelText: 'Marca',
          ),
          const SizedBox(height: 15.0),
          InputAtom(
            controller: modelController,
            validator: (value) => validateInputRequired(value, 'modelo'),
            hintText: 'Digite Modelo',
            labelText: 'Modelo',
          ),
          const SizedBox(height: 15.0),
          InputAtom(
            controller: cylinderCapacityController,
            validator: (value) {
              final isRequired = validateInputRequired(value, 'cilindraje');
              final isIntValid = validateInputNumber(value, 'cilindraje');
              if (isRequired != null) return isRequired;
              if (isIntValid != null) return isIntValid;
              return null;
            },
            keyboardType: TextInputType.number,
            hintText: 'Digite Cilindraje',
            labelText: 'Cilindraje',
          ),
        ],
      ),
    );
  }
}
