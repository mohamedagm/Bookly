import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  // apiKey Can handled throw anothers ways Like BaseUrlOptions , Also throw Interceptors
  final apiKey = dotenv.env['GOOGLE_BOOKS_API_KEY'];
  ApiService(this._dio);
  Future<Map<String, dynamic>> getBooks({required String endPoint}) async {
    Response response = await _dio.get('$baseUrl$endPoint&key=$apiKey');
    return response.data;
  }
}
