import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getPhotos extends StatefulWidget {
  const getPhotos({Key? key}) : super(key: key);

  @override
  State<getPhotos> createState() => _getPhotosState();
}

class _getPhotosState extends State<getPhotos> {
  List _get = [];

  Future _getDataPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get.clear();
          _get = data;
        });
      }
    } catch (e) {}
  }

  Future _delMhs(String id, nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/delete'),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'id': id, 'nim_progmob': nim_progmob}),
    );
    if (response.statusCode == 200) {
      _getDataPosts();
    } else {
      throw Exception('Failed to load response');
    }
  }

  @override
  void initState() {
    super.initState();
    _getDataPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataPosts,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(_get[index]['title']),
                  subtitle: CircleAvatar(
                      backgroundImage: NetworkImage(_get[index]['url'])),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: "edit",
                          child: Text("Edit"),
                        ),
                        PopupMenuItem(
                          value: "delete",
                          child: Text("Delete"),
                          onTap: () async {},
                        ),
                      ];
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
