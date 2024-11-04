part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBookSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBookSuccess({required this.books});
}

final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  NewestBooksFailure({required this.errMessage});
}
