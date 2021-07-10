import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

// ListView allows us to create rows in a list and we can add sort of data into the listView.
// it also gives us the ability to add any event listener for listen fot taps or long press
class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children: [
                  movieCard(movieList[index], context),
                  // Positioned allows to enclosed in a widget and we can position it whatever we want to position it.
                  Positioned(
                    top: 10.0,
                    child: movieImage(movieList[index].images[0]),
                  ),
                ],

            );
            // return Card(
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(
            //     /**
            //      * leading and trailing: add s.th before our subtitle or title.
            //      * trailing is going to be right and leading is always the left.
            //      */
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           color: Colors.blue,
            //           borderRadius: BorderRadius.circular(13.9),
            //           image: DecorationImage(
            //               image: NetworkImage(movieList[index].images[0]),
            //               fit: BoxFit.cover
            //           ),
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text("${movieList[index].title}"),
            //     // onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
            //     // In flutter any screen or page is called route.
            //     onTap: () {
            //       // Navigate class knows how to navigate through all the routs that we have in our application.
            //       // Push into the stack of our navigator
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetail(
            //                     movieName: movieList.elementAt(index).title,
            //                     movie: movieList[index],
            //                   )));
            //     },
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        margin: EdgeInsets.only(left: 60),
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment allows us to align items as inside of our column left to right.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Flexible wraps the text if the text is too long
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Text(
                        "rating: ${movie.imdbRating} / 10",
                        style: mainTextStyle()
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle()
                      ),
                      Text(
                        movie.runtime,
                        style: mainTextStyle()
                      ),
                      Text(
                        movie.rated,
                        style: mainTextStyle()
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        // Navigate class knows how to navigate through all the routs that we have in our application.
        // Push into the stack of our navigator
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetail(
                      movieName: movie.title,
                      movie: movie,
                    )));
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
        fontSize: 15.0,
        color: Colors.grey
    );
  }


  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            // If url is not exist, we can then pass s.th else here( placeholder for image )
            image: NetworkImage(imageUrl ?? 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),
            fit: BoxFit.cover
          )
      ),
    );
  }
}


// New route ( screen or page )
class MovieListViewDetail extends StatelessWidget {
  final String? movieName;
  final Movie? movie;

  // Key allows flutter to control how one widget replaces in the widget in tree
  const MovieListViewDetail({Key? key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          MovieDetailsThumbnail(thumbnail: movie!.images[0],),
          MovieDetailsHeaderWithPoster(movie: movie,)
        ],
      ),
    );
  }
}


class MovieDetailsThumbnail extends StatelessWidget {

  final String? thumbnail;

  const MovieDetailsThumbnail({Key? key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //میگه child هایی که داخل stack هستند alignment به این صورت است
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail!),
                  fit: BoxFit.cover
                )
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00f5f5f5), Color(0x00fff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ),
        ),
      ],
    );
  }
}


class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie? movie;

  const MovieDetailsHeaderWithPoster({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // symmetric: symmetric padding makes it so that whichever access we choose could be vertical or horizontal.
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(poster: movie!.images[0].toString(),)
        ],
      ),
    );
  }
}


class MoviePoster extends StatelessWidget {
  final String? poster;

  const MoviePoster({Key? key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      // ClipRRect: A widget that clips its child using a rounded rectangle.
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(poster!),
                fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}



