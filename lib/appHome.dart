import 'package:flutter/material.dart';
import 'helpers/constants.dart';
import 'package:flutter/rendering.dart';
import 'moviePage.dart';


// void home() => runApp(HorizontalScrollList());

class HorizontalScrollListState extends State<HorizontalScrollList> {

  final Set<String> _favorites = Set<String>();       // Change String to Json object

  void moviePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MoviePageHome(),
      )
    );
  }

  Container MovieList(String imgVal, String title, double rating) {
    final bool alreadySaved = _favorites.contains(imgVal);      //Change imgVal to json object
    return Container(                        //First Card   -- became generic card
                width: 160.0,
                // color: appDarkGreyColor,
                child: Card(                                                  //Card-- change it to link while routing along with image
                  color: appDarkGreyColor,
                  child: InkWell(
                    child:Wrap(
                      children: <Widget>[
                        Image.network(imgVal),
                        ListTile(
                          title: Text(title, style: TextStyle(color: Colors.blueAccent[400]),),
                          subtitle: Text('$rating', style: TextStyle(color: Colors.blueAccent[400]),),
                          trailing: IconButton(
                              icon: Icon(
                              alreadySaved ? Icons.favorite : Icons.favorite_border,
                              color: alreadySaved ? Colors.red : Colors.white,
                            ),
                            onPressed: (){
                              setState(() {
                                if (alreadySaved) {
                                _favorites.remove(imgVal);
                              }
                              else {
                                _favorites.add(imgVal);
                              }
                              });
                            },
                          )
                        ),
                      ],
                    ),
                    onTap: () => moviePage(context),  
                  ),
                ),
              );
  }

  Widget appBarProperty = Text(
                      'MovE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    );
  Icon searchIcon = Icon(Icons.search, color: Colors.blueAccent[400],);
  IconButton cancelButton = IconButton(icon: Icon(Icons.cancel, color: Colors.blueAccent[400],), onPressed: null);
  
  bool _searchButtonPressed = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horizontal scroll list',
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
         appBar: AppBar(
           elevation: 20.0,
           leading: IconButton(icon: Icon(Icons.menu, color: Colors.blueAccent[400]), onPressed: (){}),
           title: appBarProperty,
           actions: <Widget>[
             IconButton(
               icon: searchIcon, 
               onPressed: (){
                 _searchButtonPressed = !_searchButtonPressed;
                 setState(() {
                   if (_searchButtonPressed){
                     this.appBarProperty = TextField(
                     autofocus: true,
                    //  obscureText: false,
                     style: TextStyle(
                       color: Colors.purpleAccent[100],
                     ),
                    decoration: InputDecoration(
                      // labelText: "MovE",
                      hintText: "search",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                   }
                   else{
                     // Search query params here
                   }
                 });
             }),

              IconButton(
                icon: cancelButton,
                onPressed: () {
                  setState(() {
                    this.appBarProperty = Text(
                      'MovE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    );
                  });
                },
                )
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
                    color: Colors.purpleAccent[400],        //change to white after dark theme
                    fontSize: 18,
                  ),
                textAlign: TextAlign.left,
                )
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300,
                child: ListView(
                  
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // TODO   
                    MovieList("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1484581400079-58a319a15a2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1515875294982-4796669a7932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1528155124528-06c125d81e89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1542052722982-1c9f552a534b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=634&q=80", "title", 4.0),                           
                  ],
                ), 
              ),


              Container(    
                margin: EdgeInsets.all(10.0),
                child: Text(
                    'Favorite Movies',
                    style: TextStyle(
                    color: Colors.purpleAccent[400],        //change to white after dark theme
                    fontSize: 18,
                  ),
                textAlign: TextAlign.left,
                )
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300,
                child: ListView(
                  
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // TODO   
                    MovieList("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1484581400079-58a319a15a2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1515875294982-4796669a7932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1528155124528-06c125d81e89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1542052722982-1c9f552a534b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=634&q=80", "title", 4.0),                           
                  ],
                ), 
              ),


              Container(    
                margin: EdgeInsets.all(10.0),
                child: Text(
                    'Watch List',
                    style: TextStyle(
                    color: Colors.purpleAccent[400],        //change to white after dark theme
                    fontSize: 18,
                  ),
                textAlign: TextAlign.left,
                )
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300,
                child: ListView(
                  
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // TODO   
                    MovieList("https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1484581400079-58a319a15a2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjIxMTIzfQ&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1515875294982-4796669a7932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1528155124528-06c125d81e89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "title", 4.0),
                    MovieList("https://images.unsplash.com/photo-1542052722982-1c9f552a534b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=634&q=80", "title", 4.0),                           
                  ],
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}

class HorizontalScrollList extends StatefulWidget {
  @override
  HorizontalScrollListState createState() => HorizontalScrollListState();
}