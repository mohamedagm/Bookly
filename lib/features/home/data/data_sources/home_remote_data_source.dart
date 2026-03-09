import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/functions/save_books_hive.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.getBooks(
      endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming',
    );
    List<BookEntity> books = getBooks(data);
    saveBooksHive(books, kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.getBooks(
      endPoint:
          'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest',
    );
    List<BookEntity> books = getBooks(data);
    saveBooksHive(books, kNewestBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.getBooks(
      endPoint: 'volumes?Filtering=free-ebooks&q=$category&Sorting=relevance',
    );
    List<BookEntity> books = getBooks(data);
    saveBooksHive(books, kSimilarBooks);
    return books;
  }

  List<BookEntity> getBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
