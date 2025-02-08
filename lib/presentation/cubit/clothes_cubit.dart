import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../data/clothes.dart';
part 'clothes_state.dart';

class ClothesCubit extends Cubit<ClothesState> {
  ClothesCubit() : super(ClothesInitial());

  Future<void> fetchPosts() async {
    emit(ClothesLoading());
    try {
      final response = await http.get(Uri.parse('https://67849c811ec630ca33a4e5d5.mockapi.io/users'));
      if (response.statusCode == 200) {
        // Явное декодирование тела ответа с использованием UTF-8
        final decodedResponse = utf8.decode(response.bodyBytes);
        final List<dynamic> data = json.decode(decodedResponse);
        final posts = data.map((json) => Clothes.fromJson(json)).toList();
        emit(ClothesSuccess(clothes: posts));
      } else {
        emit(const ClothesError(error: 'Failed to load posts'));
      }
    } catch (e) {
      emit(ClothesError(error: e.toString()));
    }
  }
}
