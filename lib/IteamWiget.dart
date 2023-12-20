import 'package:dioflutter/model/post.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Post post;

  const ItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: Colors.yellowAccent,
      child: Text(post.title ?? ""),
    );

  }
}