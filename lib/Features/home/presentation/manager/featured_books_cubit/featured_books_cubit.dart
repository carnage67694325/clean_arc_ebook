import 'package:bloc/bloc.dart';
import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/Features/home/domain/use_cases/fetch_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchBooksUseCase) : super(FeaturedBooksInitial());
  final FetchBooksUseCase fetchBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(errMessage: failure.errMessage));
        } else {
          emit(FeaturedBooksPaginationFailure(errMessage: failure.errMessage));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
