import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String movieid;

  Future fetchMovie() async {
    final data =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (data.statusCode == 200) {
      return data.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future futuredata;

  @override
  void initState() {
    super.initState();
    futuredata = fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("hello world"),
        ),
        body: Center(
          child: FutureBuilder(
            future: futuredata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var x = json.decode(snapshot.data);
                print(x);
                return Text(x["title"]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// class Details extends StatelessWidget {
//   final String movieid;

//   String fetchMovie() async {
//     final data =
//         await http.get('https://jsonplaceholder.typicode.com/albums/1');
//     if (data.statusCode == 200) {
//       return data.body;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   Details({this.movieid}) {
//     fetchMovie();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("hello world"),
//         ),
//         body: Center(
//           child: Text("hello movie page"),
//         ),
//       ),
//     );
//   }
// }
