import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPage extends StatefulWidget {
  DocumentSnapshot snapshot;

  DetailPage({this.snapshot});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Card(
              elevation: 8,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(widget.snapshot.data['title'][0]),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(widget.snapshot.data['title'],
                        style: TextStyle(fontSize: 21, color: Colors.redAccent))
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Hero(
              tag: widget.snapshot.data['url'],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.snapshot.data['url'],
                height: 240,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,),

              ),
            ),
          )
        ],
      ),
    );
  }
}
