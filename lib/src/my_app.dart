import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/router/router.dart';

import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';
import 'features/motorcycle/presentation/bloc/motorcycle_bloc.dart';
import 'injection_container.dart';
import 'shared/ui/app_colors.dart';
// import 'shared/ui/molecules/scaffold.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(datastorePlugin);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      if (kDebugMode) {
        print(
            'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => service_cotainer<MotorcycleBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'MotosApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.background,
        ),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}

// home: const ScaffoldMolecule(),