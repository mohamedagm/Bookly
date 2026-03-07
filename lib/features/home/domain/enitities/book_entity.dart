import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String? bookId;
  final String? image;
  final String? title;
  final List<String>? authors;
  final String? previewLink;
  final num? averageRating;
  final num? ratingCount;

  const BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authors,
    required this.previewLink,
    required this.averageRating,
    required this.ratingCount,
  });

  @override
  List<Object?> get props {
    return [
      bookId,
      image,
      title,
      authors,
      previewLink,
      averageRating,
      ratingCount,
    ];
  }
}
