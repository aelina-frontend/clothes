import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clothes_state.dart';

class ClothesCubit extends Cubit<ClothesState> {
  ClothesCubit() : super(ClothesInitial());

  void loadClothes(){
    emit(ClothesSuccess());
  }
}
