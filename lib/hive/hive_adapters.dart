import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:hive_ce/hive_ce.dart';

@GenerateAdapters([AdapterSpec<BookEntity>()])
part 'hive_adapters.g.dart';
