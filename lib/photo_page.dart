import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key key, this.fullImageUrl}) : super(key: key);

  final String fullImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(fullImageUrl),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
