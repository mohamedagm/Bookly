import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:hive_ce/hive.dart';

Future<void> saveBooksHive(List<BookEntity> books, String boxName) async {
  var box = Hive.box<BookEntity>(boxName);
  await box.addAll(books);
}
