import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

StreamSubscription<QuerySnapshot> subscription;

List<DocumentSnapshot> snapshot;

CollectionReference collectionReference = Firestore.instance.collection("TopPost");

@override
  void initState() {
    

  
    subscription  = collectionReference.snapshots().listen((dataSnapshot){
setState(() {
  snapshot = dataSnapshot.documents;
});
    });
      super.initState();
  }

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
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      
body: ListView(
  children: <Widget>[
    Container(

      height: 200,
      child: ListView.builder(
        itemCount: snapshot.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            elevation: 10,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(snapshot[index].data['url'],
                    height:120,
                    width: 120,
                    fit:BoxFit.cover,

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot[index].data['title'],
                    style: TextStyle(color: Colors.red,
                    fontSize: 18,
                    ),

                  )
                ],
              ),
            ),
          );


        },
      ),


    )
  ],
),

    );
  }
}