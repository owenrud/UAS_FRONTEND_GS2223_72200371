import 'package:flutter/material.dart';
import 'package:flutter_application_1/Photos.dart';
import 'package:flutter_application_1/Users.dart';
import 'package:flutter_application_1/comments.dart';
import 'package:flutter_application_1/posts.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplikasi")),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(""),
                ),
                accountName: Text("Aplikasi UAS"),
                accountEmail: Text("Aplikasi CRUD Matakuliah")),
            ListTile(
              leading: Icon(Icons.access_alarm_rounded),
              title: Text("Posts"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getPosts()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_sharp),
              title: Text("Comments"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getComments()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add_call),
              title: Text("Photos"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getPhotos()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text("Users"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getUsers()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
        ],
      ), // Add a Drawer here in the next step.
    );
  }

  Card buildCard() {
    return Card(
      color: Colors.amber,
      elevation: 8,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.ad_units_outlined),
            title: Text("Lorem Ipsum is simply dummy text of the p"),
            subtitle: Text("Lorem Ipsum is simply dummy text of the p"),
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text("Buy Ticket")),
              TextButton(onPressed: () {}, child: Text("Listen")),
            ],
          )
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0),
        ),
        child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        padding: EdgeInsets.all(8.0));
  }
}
