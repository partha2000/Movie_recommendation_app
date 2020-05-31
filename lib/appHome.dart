import 'package:flutter/material.dart';
import 'helpers/constants.dart';
import 'package:flutter/rendering.dart';

import "./details.dart";

// void home() => runApp(HorizontalScrollList());

class HorizontalScrollListState extends State<HorizontalScrollList> {
  final Set<String> _favorites = Set<String>(); // Change String to Json object

  Container MovieList(String imgVal, String title, double rating,
      {BuildContext ctx}) {
    void onMovieClickhandler() {
      // route to next screen
      print("i ran");
      print(ctx);
      Navigator.of(ctx).push(MaterialPageRoute(
        builder: (_) => Details(),
      ));
    }

    final bool alreadySaved =
        _favorites.contains(imgVal); //Change imgVal to json object
    return Container(
        //First Card   -- became generic card
        width: 160.0,
        // color: appDarkGreyColor,
        child: Card(
          //Card-- change it to link while routing along with image
          color: appDarkGreyColor,
          child: InkWell(
            child: Wrap(
              children: <Widget>[
                Image.network(imgVal),
                ListTile(
                  title: Text(
                    title,
                    style: TextStyle(color: Colors.blueAccent[400]),
                  ),
                  subtitle: Text(
                    '$rating',
                    style: TextStyle(color: Colors.blueAccent[400]),
                  ),
                  trailing: Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    color: alreadySaved ? Colors.red : Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      if (alreadySaved) {
                        _favorites.remove(imgVal);
                      } else {
                        _favorites.add(imgVal);
                      }
                    });
                  },
                ),
              ],
            ),
            onTap: onMovieClickhandler,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horizontal scroll list',
      theme: ThemeData(
        primaryColor: appDarkGreyColor,
      ),
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.menu, color: Colors.blueAccent[400]),
                onPressed: () {}),
            title: Text(
              "Horizontal Scroll View",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.blueAccent[400],
                  ),
                  onPressed: () {}),
            ],
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'Top Movies',
                    style: TextStyle(
                      color: Colors
                          .purpleAccent[400], //change to white after dark theme
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // TODO
                    MovieList(
                        "https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0,
                        ctx: context),
                    MovieList(
                        "https://images.unsplash.com/photo-1484581400079-58a319a15a2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0,
                        ctx: context),
                    MovieList(
                        "https://images.unsplash.com/photo-1515875294982-4796669a7932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0,
                        ctx: context),
                    MovieList(
                        "https://images.unsplash.com/photo-1528155124528-06c125d81e89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0,
                        ctx: context),
                    MovieList(
                        "https://images.unsplash.com/photo-1542052722982-1c9f552a534b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=634&q=80",
                        "title",
                        4.0,
                        ctx: context),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'Favorite Movies',
                    style: TextStyle(
                      color: Colors
                          .purpleAccent[400], //change to white after dark theme
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // TODO
                    MovieList(
                        "https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1484581400079-58a319a15a2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1515875294982-4796669a7932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1528155124528-06c125d81e89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1542052722982-1c9f552a534b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=634&q=80",
                        "title",
                        4.0),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    'Watch List',
                    style: TextStyle(
                      color: Colors
                          .purpleAccent[400], //change to white after dark theme
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  )),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // TODO
                    MovieList(
                        "https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1484581400079-58a319a15a2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1515875294982-4796669a7932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1528155124528-06c125d81e89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        "title",
                        4.0),
                    MovieList(
                        "https://images.unsplash.com/photo-1542052722982-1c9f552a534b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=634&q=80",
                        "title",
                        4.0),
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}

class HorizontalScrollList extends StatefulWidget {
  @override
  HorizontalScrollListState createState() => HorizontalScrollListState();
}
