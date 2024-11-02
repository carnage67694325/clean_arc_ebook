import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arc_bookly/core/errors/failure.dart';
import 'package:clean_arc_bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase implements UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
