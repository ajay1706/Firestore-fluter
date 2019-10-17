import 'dart:async';

import 'package:firestore_flutter/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//For TopPost
StreamSubscription<QuerySnapshot> subscription;

List<DocumentSnapshot> snapshot;

CollectionReference collectionReference = Firestore.instance.collection("TopPost");

//For body post
StreamSubscription<QuerySnapshot> sdSubscription;
List<DocumentSnapshot> sdSnapshot;
CollectionReference sdCollectionReference = Firestore.instance.collection("BodyPost");



@override
  void initState() {   
    subscription  = collectionReference.snapshots().listen((dataSnapshot){
setState(() {
  snapshot = dataSnapshot.documents;
});
    });
sdSubscription = sdCollectionReference.snapshots().listen((sdDataSnapshot){
  setState(() {
    sdSnapshot = sdDataSnapshot.documents;
  });


});

      super.initState();
  }

  passData(DocumentSnapshot snap){
    Navigator.of(context).push(MaterialPageRoute(builder:(context) => DetailPage(snapshot: snap,)));
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


    ),

    Container(
        height: MediaQuery.of(context).size.height,
       child: ListView.builder(
         itemCount: sdSnapshot.length,
         itemBuilder: (context, index){
     return Card(
       elevation: 8,
       margin: EdgeInsets.all(10),
       child: Container(
         padding: EdgeInsets.all(10),
         child: Column(
           children: <Widget>[
             Row(
               children: <Widget>[
                 CircleAvatar(
                   
                   child: Text(sdSnapshot[index].data['title'][0]),
                   backgroundColor: Colors.redAccent,
                   foregroundColor: Colors.white,
                   
                 ),
                 SizedBox(width: 10,),
                 InkWell(
                                    child: Text(sdSnapshot[index].data['title'],
                   style: TextStyle(fontSize: 20,color:Colors.black),),
                 onTap: () => passData(sdSnapshot[index]),
                 
                 )

                
               ],
             ),
             SizedBox(
               height:10 ,
             ),
             Column(
               children: <Widget>[
               Hero(
                 tag: sdSnapshot[index].data['url'],
                 child: ClipRRect(

                   borderRadius: BorderRadius.circular(15),
                   child: Image.network(sdSnapshot[index].data['url'],
                   height: 180,
                   width: MediaQuery.of(context).size.width,
                   fit: BoxFit.cover,),

                 ),
               ),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Icon(Icons.thumb_up,color: Colors.green,),
            
                   Icon(Icons.share,color: Colors.blue,),
             
                   Icon(Icons.thumb_down,color: Colors.red,)
                 ],
               )
               ],
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