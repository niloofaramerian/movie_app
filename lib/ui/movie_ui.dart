import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

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
              height: 170,
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
          MoviePoster(poster: movie!.images[0].toString(),),
          // SizedBox is used to create space in that we have control or how wide or tall this space
          SizedBox(width: 16,),
          Expanded(child: MovieDetailsHeader(movie: movie,)),

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


class MovieDetailsHeader extends StatelessWidget {

  final Movie? movie;

  const MovieDetailsHeader({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // Every thing is going starts from the left
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie!.year} . ${movie!.genre}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.cyan
          ),
        ),
        Text(
          movie!.title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 32
          ),
        ),
        // rich text give us other properties we can pass like inLine span
        Text.rich(
            TextSpan(style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300
            ),
                children: <TextSpan> [
                  TextSpan(
                      text: movie!.plot
                  ),
                  TextSpan(
                      text: "More...",
                      style: TextStyle(
                          color: Colors.indigo
                      )
                  )
                ]
            )
        ),
      ],
    );
  }
}


class MovieDetailsCast extends StatelessWidget {
  final Movie? movie;

  const MovieDetailsCast({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie!.actors,),
          MovieField(field: "Directors", value: movie!.director,),
          MovieField(field: "Awards", value: movie!.awards,)
        ],
      ),
    );
  }
}


class MovieField extends StatelessWidget {
  final String? field;
  final String? value;

  const MovieField({Key? key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      /**
       * crossAxisAlignment in flutter => direction in kotlin
       * mainAxisAlignment in flutter => gravity in kotlin
       */
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field : ",
          style: TextStyle(
              color: Colors.black38,
              fontSize: 12,
              fontWeight: FontWeight.w300
          ),
        ),
        /**
         * Expanded like matchParent in kotlin
         */
        Expanded(
          child: Text(
            value!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w300
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}


class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String>? posters;

  const MovieDetailsExtraPosters({Key? key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "More Movie Posters".toUpperCase(),
            style: TextStyle(
                fontSize: 14,
                color: Colors.black26
            ),
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // separatorBuilder separate items in our list
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: posters!.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posters![index]),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}








