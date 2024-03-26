import 'package:flutter/material.dart';
import 'package:flutter_todo_app2/models/todo.dart';
import 'package:flutter_todo_app2/themes/themes.dart';

class ToDoItem  extends StatelessWidget {
  ToDoItem ({super.key, required this.todo, this.onToDoChanged, this.onDeleteTask});

  final ToDo todo;
  final onToDoChanged;
  final onDeleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
      onTap: (){
        print('Clicked on Todo Item');
        onToDoChanged(todo);
      },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        tileColor: Colors.white,
        leading: Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, color: Blue,),
        title: Text(
          todo.Task!, 
          style: TextStyle(
            fontSize: 18, 
            color: Black, 
            decoration: todo.isDone? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 11),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Red,
          borderRadius: BorderRadius.circular(5) 
        ),
        child: IconButton(
          color: Colors.white,
          iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: () {
            print('Clicked on Delete icon');
            onDeleteTask(todo.id);
          },
        ),
      ),
    ));
  }
}