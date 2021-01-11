import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/todo_screen.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'New Task',
            ),
            // The validator receives the text that the user has entered.
            validator: (String text) {
              if (text.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String text) {
              Task task = Task(text);
              task.save();
              tasks.add(task);
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text('Data Saved'),
              //   ),
              // );
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              final form = _formKey.currentState;
              if (form.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                // Scaffold.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('Processing Data'),
                //   ),
                // );
                form.save();
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
