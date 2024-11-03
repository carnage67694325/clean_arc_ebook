import 'package:clean_arc_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arc_bookly/Features/home/data/data_sources/home_remote_data_resource.dart';
import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arc_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
