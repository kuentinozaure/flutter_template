import 'package:flutter/material.dart';
import 'package:flutter_template/services/album-service.dart';
import 'package:flutter_template/model/album.dart';

class AlbumComponent extends StatefulWidget {
  @override
  _AlbumComponentState createState() => _AlbumComponentState();
}

class _AlbumComponentState extends State<AlbumComponent> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAlbums(),
      builder: (context, snapshot) {

       if (snapshot.hasData) {
         List<Album> data = snapshot.data;

          return ListView.builder(
            itemCount: data.length,

            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title, style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),

                subtitle: Text(data[index].id.toString()),
                leading: Icon(
                  Icons.work,
                  color: Colors.blue[500],
                ),
              );
            });

        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}