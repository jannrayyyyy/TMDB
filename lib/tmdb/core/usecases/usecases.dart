import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure/catche_failure.dart';
import '../error/failure/server_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ServerFailure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FavoriteIdParams extends Equatable {
  @override
  List<Object?> get props => [id];
  final int id;
  const FavoriteIdParams({
    required this.id,
  });
}

abstract class Usecase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class Usecases<Type, Params> {
  Future<Either<CachedFailure, Type>> call(Params params);
}
