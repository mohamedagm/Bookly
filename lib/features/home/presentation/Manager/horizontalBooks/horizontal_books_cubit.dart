import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'horizontal_books_state.dart';

class HorizontalBooksCubit extends Cubit<HorizontalBooksState> {
  HorizontalBooksCubit() : super(HorizontalBooksInitial());
}
