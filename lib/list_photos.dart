import 'package:flutter/material.dart';
import 'package:test_project/data/photos_data.dart';
import 'package:test_project/data_parse/photos_parsing.dart';
import 'package:test_project/photo_page.dart';

class ListPhotos extends StatelessWidget {
  const ListPhotos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetch(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Photos> list = snapshot.data;
          return snapshot.hasData
              ? Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: list
                          .map(
                            (photo) => Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: Image.network(
                                        photo.urls.thumb,
                                        fit: BoxFit.contain,
                                        height: 100,
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => PhotoPage(
                                                    fullImageUrl:
                                                        photo.urls.full)));
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        photo.altDescription,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        photo.sponsorship != null
                                            ? 'Author: ' +
                                                photo.sponsorship.sponsor.name
                                            : 'Author: ' + photo.user.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList()),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
