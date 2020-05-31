import 'package:flutter/material.dart';
import 'appHome.dart';

// void main() => runApp(MoviePage());

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MoviePageHome(),
    );
  }
}

class MoviePageHome extends StatefulWidget {
  @override
  MoviePageHomeState createState() => MoviePageHomeState();
}

class MoviePageHomeState extends State<MoviePageHome> {

  void home(BuildContext context) {
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: (_) => HorizontalScrollList(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network('https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            ),
        Scaffold(
          backgroundColor: Colors.transparent,  
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, left:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                      onPressed: () => home(context),
                    ),
                  //  Container(
                  //   width: 125.0,
                  //   child: Row(
                  //     children: <Widget>[

                  //     ],
                  //     ), 
                  //  ) 
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      'Movie Title',
                      style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0, 
                      ),
                    ),
                    SizedBox(width: 95,),
                    IconButton(icon: Icon(Icons.favorite_border), onPressed: (){}, iconSize: 34,),
                    IconButton(icon: Icon(Icons.bookmark_border), onPressed: (){}, iconSize: 34), 
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.black,
                  child: Wrap(
                   children: <Widget>[
                     Text('Some Text here', style: TextStyle(color: Colors.white ),),
                     Text('Some more Sample Text here',style: TextStyle(color: Colors.white ),),
                     Text('More text here', style: TextStyle(color: Colors.white ),),
                     Text('Annoyingly Last piece of text here', style: TextStyle(color: Colors.white ),)
                   ], 
                  ),

                ),
              ),
              // Add Container Inside Padding and Put the necessary stuff
            ],
          ),
        )
      ],
    );
  }
}