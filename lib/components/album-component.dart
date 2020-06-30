import 'package:flutter/material.dart';
import 'package:flutter_template/services/album-service.dart';
import 'package:flutter_template/model/album.dart';

class AlbumS extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<AlbumS> {

  Future<List<Album>> albums;

  @override
  void initState() {
    super.initState();
  }

  Widget _createListFromApi() {
    return FutureBuilder(
      future: getAlbums(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (snapshot.hasData) {
          List<Album> data = snapshot.data;

          return ListView.builder(
            itemCount: data.length,
              itemBuilder: (context, index) {
                Album albumItem = data[index];
                return _createRowList(albumItem.title);
              }
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget _createRowList(String title) {
    final _biggerFont = TextStyle(fontSize: 18.0);
    return ListTile(
      title: Text(
        title,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test backend call"),
      ),
      body: _createListFromApi(),
      
    );
  }
}