import 'package:isar/isar.dart';
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

//* funcion para abrir la BD y si ya la tenemos, la usamos
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          MovieSchema
        ], //? es el que se creo cuando se hizo el comando `flutter pub run build_runner build`
        inspector:
            true, //? poder tener el servicio para analizar la BD local del dispositivo
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    //? esperar que este lista la base de datos
    final isar = await db;

    //? preguntar si en la BD existe la pelicular por ese id

    //?.movies es la entidad y el mismo isar da los metodos segun cada propiedad de mi entidad
    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;

    //? buscar todas las peliculas segun el offset y el limite
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    //?actualizacion

    //? buscar si existe la pelicula
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      //?borrar
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));

      return;
    }

    //?insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
