import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: const Center(
        child: Text('Todo List 1'),
      ),
    );
  }
}
