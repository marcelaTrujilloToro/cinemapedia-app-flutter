import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/datasources/actor_moviebd_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';

//? este provider es de solo lectura ya uqe es inmutable

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedDbDatasource());
});
