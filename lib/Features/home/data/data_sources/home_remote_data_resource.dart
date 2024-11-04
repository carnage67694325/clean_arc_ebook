import 'dart:ui';

import 'package:clean_arc_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/constants.dart';
import 'package:clean_arc_bookly/core/functions/save_books.dart';
import 'package:clean_arc_bookly/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&sorting=Revelance &q=Subject:comic');
    List<BookEntity> books = getBookList(data);
    saveBooks(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&sorting=Newest&q=Subject:comic');
    List<BookEntity> books = getBookList(data);
    saveBooks(books: books, boxName: kNewestBox);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }

    return books;
  }
}
