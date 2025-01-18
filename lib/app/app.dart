import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkup_mobile/features/auth/presentation/view/login_view.dart';
import 'package:linkup_mobile/features/auth/presentation/view_model/login/bloc/authbloc/auth_bloc.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'LinkUp',
        home: LoginView(),
      ),
    );
  }
}
