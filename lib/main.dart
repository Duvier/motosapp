import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import './src/injection_container.dart' as di;
import 'src/features/motorcycle/presentation/bloc/motorcycle_bloc.dart';
import 'src/injection_container.dart';
import 'src/shared/ui/app_colors.dart';
import 'src/shared/ui/molecules/scaffold.dart';
import 'src/shared/ui/navigator_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

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
      providers: [BlocProvider(create: (context) => sl<MotorcycleBloc>())],
      child: MaterialApp(
        title: 'MotosApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: AppColors.background,
          scaffoldBackgroundColor: AppColors.background,
        ),
        home: const ScaffoldMolecule(),
        navigatorKey: NavigatorKeys.navigatorKeyMain,
      ),
    );
  }
}
