import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/usescases/usecase.dart';
import '../../bloc/motorcycle_bloc.dart';
import '../molecules/form_motorcycle.dart';

class AddMotorcycle extends StatefulWidget {

  const AddMotorcycle({Key? key}) : super(key: key);

  @override
  State<AddMotorcycle> createState() => _AddMotorcycleState();
}

class _AddMotorcycleState extends State<AddMotorcycle> {
  final formMotorcycle = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final cylinderCapacityController = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    brandController.dispose();
    modelController.dispose();
    cylinderCapacityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          FormMotorcycle(
            formKey: formMotorcycle,
            nameController: nameController,
            brandController: brandController,
            modelController: modelController,
            cylinderCapacityController: cylinderCapacityController,
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () => _dispatchEventSaveMotorcycle(context),
            child: const Text('Guardar'),
          )
        ],
      ),
    );
  }

  _dispatchEventSaveMotorcycle(BuildContext context) {
    if (formMotorcycle.currentState!.validate()) {
      final params = ParamsMotorcycle(
        name: nameController.text,
        brand: brandController.text,
        model: modelController.text,
        image: 'default.png',
        cylinderCapacity: int.parse(cylinderCapacityController.text),
      );
      BlocProvider.of<MotorcycleBloc>(context)
           .add(SaveMotorcyclesEvent(params));
      formMotorcycle.currentState?.reset();
      Navigator.pop(context);
      BlocProvider.of<MotorcycleBloc>(context).add(GetListMotorcyclesEvent());
    }
  }
}
