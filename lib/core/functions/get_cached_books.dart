import 'package:clean_arc_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

List<BookEntity> getCachedBooks(
    {required String boxName, required int pageNumber}) {
  int startIndex = pageNumber * 10;
  int endIndex = (pageNumber + 1) * 10;

  var box = Hive.box<BookEntity>(boxName);
  int length = box.values.length;
  if (startIndex > length || endIndex > length) {
    return [];
  }
  return box.values.toList().sublist(startIndex, endIndex);
}
