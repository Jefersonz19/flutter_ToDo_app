class ToDo {
  String? id;
  String? Task;
  bool isDone;

  ToDo({
    required this.id,
    required this.Task,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01',Task: 'Morning Exercise', isDone: true),
      ToDo(id: '02', Task: 'Work Meeting', ),
      ToDo(id: '03', Task: 'Mom Call'),
      ToDo(id: '04', Task: 'Buy some groceries ', isDone: true),
      ToDo(id: '05', Task: 'Take out the dog'),
      ToDo(id: '06', Task: 'Familiar dinner'),
      ToDo(id: '07', Task: 'check emails'),
    ];
  }
}