import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clothes_event.dart';
part 'clothes_state.dart';

class ClothesBloc extends Bloc<ClothesEvent, ClothesState> {
  ClothesBloc() : super(ClothesInitial()) {
    on<ClothesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
