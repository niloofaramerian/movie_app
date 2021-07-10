import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

// ListView allows us to create rows in a list and we can add sort of data into the listView.
// it also gives us the ability to add any event listener for listen fot taps or long press
class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();

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
          itemCount: movieList.length,
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
                        borderRadius: BorderRadius.circular(13.9)),
                    child: Text("H"),
                  ),
                ),
                trailing: Text("..."),
                title: Text(movieList[index].title),
                subtitle: Text("${movieList[index].title}"),
                // onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
                // In flutter any screen or page is called route.
                onTap: () {
                  // Navigate class knows how to navigate through all the routs that we have in our application.
                  // Push into the stack of our navigator
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieListViewDetail(movieName: movieList.elementAt(index).title,)
                      )
                  );
                },
              ),
            );
          }),
    );
  }
}

// New route ( screen or page )
class MovieListViewDetail extends StatelessWidget {
  final String? movieName;

  // Key allows flutter to control how one widget replaces in the widget in tree
  const MovieListViewDetail({Key? key, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text("Go back $movieName"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
