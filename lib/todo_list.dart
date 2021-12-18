import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class TodoList extends StatelessWidget {
  const TodoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: FirestoreListView(
        query: FirebaseFirestore.instance.collection('todos'),
        pageSize: 15,
        itemBuilder: (BuildContext context, QueryDocumentSnapshot<dynamic> doc) {
          final todo = doc.data();
          return ListTile(
            title: Text(todo['title']),
            subtitle: Text(todo['description']),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => doc.reference.delete(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance.collection('todos').add({
            'title': 'New Todo',
            'description': DateTime.now().toString(),
          });
        },
      ),
    );
  }
}
