import 'package:flutter/material.dart';

import '../data/todo_data.dart';
import '../models/todo.dart';
import '../widgets/add_todo_dialog.dart';
import '../widgets/empty_state.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> todos = [...initialTodos];

  void addTodo(String title) {
    setState(() {
      todos.add(Todo(title: title));
    });
  }

  void toggleTodo(int index) {
    setState(() {
      todos[index].isCompleted = !todos[index].isCompleted;
    });
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AddTodoDialog(onAdd: addTodo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My To-Do List')),
      body: todos.isEmpty
          ? const EmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  todo: todos[index],
                  onChanged: () => toggleTodo(index),
                  onDelete: () => deleteTodo(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
