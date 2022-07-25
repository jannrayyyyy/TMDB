import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/error_message.dart';
import '../../../domain/entities/cast_entity.dart';
import '../../../domain/usecases/get_cast.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final GetCast _getCast;
  CastCubit(this._getCast) : super(CastInitial());

  void getCast(int id) async {
    emit(CastLoading());
    final eitherCastorError = await _getCast(CastParams(id: id));
    eitherCastorError.fold(
        (l) => emit(const CastError(msg: ERROR_LOADING_DATA)),
        (casts) => emit(CastLoaded(cast: casts)));
  }
}
