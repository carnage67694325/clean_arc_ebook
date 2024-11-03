import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

List<BookEntity> getCachedBooks({required String bookName}) {
  var box = Hive.box<BookEntity>(bookName);
  return box.values.toList();
}
