part of 'clothes_cubit.dart';

sealed class ClothesState extends Equatable {
  const ClothesState();

  @override
  List<Object> get props => [];
}

final class ClothesInitial extends ClothesState {}

final class ClothesLoading extends ClothesState {}

final class ClothesSuccess extends ClothesState {

}

final class ClothesError extends ClothesState {
  final String error;

  const ClothesError({required this.error});

  @override
  List<Object> get props => [error];
}
