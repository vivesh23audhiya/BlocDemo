import 'package:blocdemo/todo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.lightBlue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Cubit view',
                        style: TextStyle(fontSize: 26),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CounterCubit, int>(
                          bloc: counterCubit,
                          builder: (context, counter) {
                            return Text(
                              '$counter',
                              style: Theme.of(context).textTheme.headlineMedium,
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                counterCubit.incrementCount();
                              },
                              child: const Text('Increment')),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                counterCubit.decrementCount();
                              },
                              child: const Text('Decrement')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Bloc view',
                        style: TextStyle(fontSize: 26),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CounterBloc, int>(
                          bloc: counterBloc,
                          builder: (context, counter) {
                            return Text(
                              '$counter',
                              style: Theme.of(context).textTheme.headlineMedium,
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                counterBloc.add(CounterIncremented());
                              },
                              child: const Text('Increment')),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                counterBloc.add(CounterDecremented());
                              },
                              child: const Text('Decrement')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoPage(title: "Todo demo"),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                width: double.maxFinite,
                color: Colors.lightGreen,
                padding: const EdgeInsets.all(8),
                child: const Center(
                    child: Text(
                  "Click here for todo demo",
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
