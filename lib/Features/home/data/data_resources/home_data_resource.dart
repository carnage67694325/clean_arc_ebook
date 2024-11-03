import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeDataResource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}
