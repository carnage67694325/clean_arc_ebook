import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/constants.dart';
import 'package:clean_arc_bookly/core/functions/get_cached_books.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeDatalocalSourceImp implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    return getCachedBooks(bookName: kFeaturedBox);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
