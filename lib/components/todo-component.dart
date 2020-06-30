import 'package:flutter/material.dart';
import 'package:flutter_template/model/todo.dart';
import 'package:flutter_template/services/todo-service.dart';

class ToDoComponent extends StatefulWidget {
  @override
  _ToDoComponentState createState() => _ToDoComponentState();
}

class _ToDoComponentState extends State<ToDoComponent> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getTodos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (snapshot.hasData) {

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(1),
                    child: dataTableToDo(snapshot.data)
                ),
              )
            ],
          );

        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
          
      }
    );
  }

  // needed to build the datatable dynamicly
  SingleChildScrollView dataTableToDo(List<Todo> listOfTodos) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
          sortColumnIndex: 0,
          showCheckboxColumn: false,
          columns: [
            DataColumn(
                label: Text("User id"),
                numeric: false,
                tooltip: "User id"
            ),
            DataColumn(
              label: Text("Title"),
              numeric: false,
              tooltip: "Title",
            ),

            DataColumn(
              label: Text("Completed"),
              
              tooltip: "Completed",

            ),
          ],

          rows: listOfTodos
              .map(
                (todo) => DataRow(
                onSelectChanged: (b) {
                  print(todo.id.toString());
                },
                cells: [
                   DataCell(
                      Text(todo.userId.toString())
                  ),
                  DataCell(
                    Text(todo.title),
                  ),
                   DataCell(
                    Checkbox(value: todo.completed, onChanged: null)
                  ),

                ]),
              ).toList(),
        ),
    );}
}