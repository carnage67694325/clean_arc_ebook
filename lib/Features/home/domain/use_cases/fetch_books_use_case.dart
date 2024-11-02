import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arc_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase {
  final HomeRepo homeRepo;

  FetchBooksUseCase({required this.homeRepo});
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    return homeRepo.fetchFeaturedBooks();
  }
}
