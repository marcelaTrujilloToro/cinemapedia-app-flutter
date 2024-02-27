import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDb) => Movie(
        adult: movieDb.adult,
        backdropPath: movieDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
            : 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmir-s3-cdn-cf.behance.net%2Fproject_modules%2Fmax_1200%2Ffb3ef66312333.5691dd2253378.jpg&tbnid=_mLFMesCfZusyM&vet=12ahUKEwiAvrP65cmEAxXTYjABHa6jACEQxiAoCnoECAAQKg..i&imgrefurl=https%3A%2F%2Fwww.behance.net%2Fgallery%2F6312333%2FFile-Not-Found-Movie-Poster%3Flocale%3Dcs_CZ&docid=C87rPtPiG_cp5M&w=1200&h=1801&itg=1&q=no%20poster%20found&ved=2ahUKEwiAvrP65cmEAxXTYjABHa6jACEQxiAoCnoECAAQKg',
        genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: movieDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
            : 'no-poster',
        releaseDate: movieDb.releaseDate,
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );
}
