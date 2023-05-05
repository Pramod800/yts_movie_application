import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sort_movies_state.dart';

class SortMoviesCubit extends Cubit<SortMoviesState> {
  SortMoviesCubit() : super(SortMoviesInitial());
}
