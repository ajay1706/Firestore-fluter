import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Backend"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint("Search"),
          ),
             IconButton(
            icon: Icon(Icons.add),
            onPressed: () => debugPrint("Add"),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[


            UserAccountsDrawerHeader(
              accountName: Text("Ajay"),
              accountEmail:Text("xyz123@gmail.com") ,
              decoration: BoxDecoration(
                color: Colors.redAccent
              ),
            ),

            ListTile(
              title: Text("First Page"),
              leading: Icon(Icons.search,color:Colors.green),
            ),
              ListTile(
              title: Text("Second Page"),
              leading: Icon(Icons.add,color:Colors.blueGrey),
            ),
              ListTile(
              title: Text("Third Page"),
              leading: Icon(Icons.help,color:Colors.redAccent),
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
              ListTile(
              title: Text("Close "),
              trailing: Icon(Icons.close,color:Colors.red),
            )
          ],
        ),
      ),
      
    );
  }
}