import 'dart:convert';
import 'package:flutter_template/model/album.dart';
import 'package:http/http.dart' as http;


Future<Album> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> getAlbums() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/');

  if (response.statusCode == 200) {

    List<Album> albums ;
    List jsonResponse = json.decode(response.body);
    albums = jsonResponse.map((album) => new Album.fromJson(album)).toList();
    return albums;
    
  } 
  else {
    throw Exception('Failed to load album');
  }
}