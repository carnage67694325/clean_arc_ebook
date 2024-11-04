import 'package:bloc/bloc.dart';
import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/Features/home/domain/use_cases/fetch_newest_book_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchBooksNewsetUseCase) : super(NewestBooksInitial());
  final FetchBooksNewsetUseCase fetchBooksNewsetUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchBooksNewsetUseCase.call();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(NewestBookSuccess(books: books));
      },
    );
  }
}
