import 'package:flutter/material.dart';
import 'package:flutter_template/components/home-component.dart';
import 'package:flutter_template/components/todo-component.dart';
import 'package:flutter_template/core/navlink.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  int _selectedIndexBottomNavBar = 1;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold); 
  
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Album',
      style: optionStyle,
    ),
    HomePageComponent(),
    ToDoComponent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Crud App'),

        // useless is for the technic process to avoid to search
        actions: <Widget>[
          PopupMenuButton<String>(
            // onSelected: _onSelectedAction,
            itemBuilder: (BuildContext context){
              return NavLinks.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],


      ),

      body: Container(
        child: _widgetOptions.elementAt(_selectedIndexBottomNavBar),
      ),

      bottomNavigationBar: BottomNavigationBar(
        
        // properties of bottom navigation bar
        currentIndex: _selectedIndexBottomNavBar,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,

        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text("Album"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            title: Text("To do"),
          ),

        ],
      ),

    );
  }

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndexBottomNavBar = index;
    });
  }

}
