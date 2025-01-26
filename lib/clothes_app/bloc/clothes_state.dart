part of 'clothes_bloc.dart';

sealed class ClothesState extends Equatable {
  const ClothesState();
}

final class ClothesInitial extends ClothesState {
  @override
  List<Object> get props => [];
}
