import 'package:flutter/material.dart';

// ListView allows us to create rows in a list and we can add sort of data into the listView.
// it also gives us the ability to add any event listener for listen fot taps or long press
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
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                /**
                 * leading and trailing: add s.th before our subtitle or title.
                 * trailing is going to be right and leading is always the left.
                 */
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(13.9)
                    ),
                    child: Text("H"),
                  ),
                ),
                trailing: Text("..."),
                title: Text(movies[index]),
                subtitle: Text("Sub"),
                onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
              ),
            );
          }),
    );
  }
}
