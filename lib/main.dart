import 'package:blocdemo/bloc/auth_bloc.dart';
import 'package:blocdemo/bloc/counter_bloc.dart';
import 'package:blocdemo/cubit/counter_cubit.dart';
import 'package:blocdemo/cubit/todo_cubit.dart';
import 'package:blocdemo/login_page.dart';
import 'package:blocdemo/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
        const CounterPage(title: 'Flutter bloc demo'),
        //const TodoPage(title: 'Todo demo')
      ),
    );
  }
}


