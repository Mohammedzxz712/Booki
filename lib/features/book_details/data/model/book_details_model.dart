
import 'package:bookly/features/book_details/domain/entity/book_details_entity.dart';



class BookDetailsModel extends BookDetailsEntity {
  const BookDetailsModel({
    required super.name,
    required super.author,
    required super.price,
    required super.rating,
    required super.numberOfPages,
    required super.language,
    required super.description,
    required super.kind,
    required super.imageUrl,

  }) ;

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      name: json['volumeInfo']['title'] ?? "Unknown Title",
      author: (json['volumeInfo']['authors'] as List?)?.join(", ") ?? "Unknown Author",
      price: json['saleInfo']?['listPrice']?['amount']?.toDouble()?? 0.0,
      rating: json['volumeInfo']['averageRating']?.toDouble()?? 0.0,
      numberOfPages: json['volumeInfo']['pageCount']?? 0,
      language: json['volumeInfo']['language'] ?? "Unknown",
      description: json['volumeInfo']['description'] ?? "No description available",
      kind: json['kind'] ?? "Unknown",
      imageUrl: json['volumeInfo']['imageLinks']?['thumbnail'] ??
          "https://via.placeholder.com/150", // Default placeholder image
    );
  }
}
