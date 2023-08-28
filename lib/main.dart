import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_app/app_block.dart';
import 'package:lesson_app/app_evetns.dart';

import 'app_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBlocs>(
      create: (context) => AppBlocs(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocBuilder<AppBlocs, AppStates>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(BlocProvider.of<AppBlocs>(context).state.counter.toString()),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () => BlocProvider.of<AppBlocs>(context).add(Increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => BlocProvider.of<AppBlocs>(context).add(Decrement()),
              tooltip: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
