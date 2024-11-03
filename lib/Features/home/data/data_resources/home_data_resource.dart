import 'dart:ui';

import 'package:clean_arc_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/core/utils/api_service.dart';

abstract class HomeDataResource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeDataResourceImpl implements HomeDataResource {
  final ApiService apiService;

  HomeDataResourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&sorting=Revelance &q=Subject:comic');
    return getBookList(data);
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&sorting=Revelance &q=Subject:comic');
    return getBookList(data);
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
