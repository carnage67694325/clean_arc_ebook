import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arc_bookly/constants.dart';
import 'package:hive/hive.dart';

void saveBooks({required List<BookEntity> books, required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
