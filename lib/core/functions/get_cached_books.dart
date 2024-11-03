import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

List<BookEntity> getCachedBooks({required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);
  return box.values.toList();
}
