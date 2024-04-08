import 'package:blocdemo/cubit/todo_cubit.dart';
import 'package:blocdemo/login_page.dart';
import 'package:blocdemo/model/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TextEditingController todoTextEditingController =
        TextEditingController();
    // context.read<TodoCubit>().addTodo(title)
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
              child:
                  BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
                return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Text(todo.name);
                    });
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: todoTextEditingController,
                    decoration:
                        const InputDecoration(hintText: "Add todo title"),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        todoCubit
                            .addTodo(todoTextEditingController.text.trim());
                        todoTextEditingController.text = '';
                      },
                      child: const Text('Add todo')),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
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
                  "Click here for login",
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
