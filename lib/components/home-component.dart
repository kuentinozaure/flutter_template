import 'package:flutter/material.dart';

class HomePageComponent extends StatefulWidget {
  @override
  _HomePageComponentState createState() => _HomePageComponentState();
}

class _HomePageComponentState extends State<HomePageComponent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
          margin: const EdgeInsets.only(top: 50),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('This application can be display lot of data from placeholder api'),
                  subtitle: Text('This api can mock data for the futur developpment'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Ok'),
                      onPressed: () {/* ... */},
                    ),
                    FlatButton(
                      child: const Text('Go to'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]
    );
  }
}