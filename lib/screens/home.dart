import 'package:flutter/material.dart';
import 'package:flutter_todo_app2/models/todo.dart';
import 'package:flutter_todo_app2/themes/themes.dart';
import '../widgets/todo_item.dart';
import 'navbar.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _taskController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Gray,
      drawer: NavBar(),
      appBar: _appBar(),
      body: Stack(
        children: [
          Container(
           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
             child: Column(
              children: [ 
                searchBox(),
                  Expanded(child: 
                    ListView(
                      children: [
                        Container(
                        margin: EdgeInsets.only(
                        top: 50,
                       bottom: 20,
                      ),
                  child: Text('All ToDo List Displayed', 
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: White)),
                ),
                for (ToDo todo_ in _foundToDo)
                  ToDoItem(todo: todo_,
                  onToDoChanged: _handleToDoChange,
                  onDeleteTask: _deleteToDoTask,),
              ],
            ),
          )
        ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(children: [
          Expanded(child: Container(margin: EdgeInsets.only(bottom: 20 ,right: 10, left: 10,),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [BoxShadow(
                  color: Colors.black, 
                  offset: Offset(0.0, 0.0),
                  blurRadius: 25.0,
                  spreadRadius: 2.0),
                ],
               borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  hintText: 'Add a new Task',
                  border: InputBorder.none
                ),
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, right: 10),
            child: ElevatedButton(
              child: Text('+', style: TextStyle(fontSize: 40,),),
              onPressed: (
              ) {
                _addToDoItem(_taskController.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Blue,
                minimumSize: Size(50, 60),
                elevation: 10,

              ),
            ),
          )
        ]),
      ),
     ],
    ),
    );
  }

void _handleToDoChange(ToDo todo){
  setState(() {
      todo.isDone = !todo.isDone;
  });
}

void _deleteToDoTask(String id){
  setState((){
      todosList.removeWhere((element) => element.id == id);
  });
}

void _addToDoItem(String toDo){
  setState((){
  todosList.add(ToDo(id:  DateTime.now().millisecondsSinceEpoch.toString(), Task: toDo));
  });
  _taskController.clear();
}

void _Filter(String keywordText){
  List<ToDo> results = [];
  if (keywordText.isEmpty){
    results = todosList;
  } else {
    results = todosList.where((element) => element.Task!
    .toLowerCase()
    .contains(keywordText.toLowerCase())).toList();
  }

  setState(() {
    _foundToDo = results;
  });

}

Widget searchBox(){
  return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: TextField(
              onChanged: (value) => _Filter(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search, color: Black, size: 25,
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 20,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: 'Search', 
              ),
            ),
        );
}

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Blue,
      elevation: 20,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        /*IconButton(
          icon: const Icon(Icons.menu),
          color: Black, 
          onPressed: () {
                drawer: NavBar();
                print('Clicked on Menu Bottom');
              },
        ),*/

        Text('Jefer To Do App', style: TextStyle(color: Black),),
        Container(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('assets/ToDo3.png'),
            ),
          ),
        ]),
      );
  }
}