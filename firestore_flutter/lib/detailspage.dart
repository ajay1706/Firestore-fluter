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
        title: 
        Text( "Post Details" ),
        backgroundColor: Colors.redAccent,
      ),
      
    );
  }
}