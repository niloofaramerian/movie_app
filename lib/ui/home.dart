import 'package:flutter/material.dart';

// ListView allows us to create rows in a list and we can add sort of data into the listView.
class MovieListView extends StatelessWidget {

  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Vikings",
    "Vikings"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text(movies[index]),
              ),
            );
          }),
    );
  }
}
