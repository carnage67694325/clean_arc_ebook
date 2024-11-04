import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/constants.dart';
import 'package:clean_arc_bookly/core/functions/get_cached_books.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNUmber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeDatalocalSourceImp implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNUmber = 0}) {
    return getCachedBooks(boxName: kFeaturedBox, pageNumber: pageNUmber);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    return getCachedBooks(boxName: kNewestBox, pageNumber: 0);
  }
}
