import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void toHome() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeInitial());
  }
}
