import 'package:equatable/equatable.dart';

class BookDetailsEntity extends Equatable {
  final String name;
  final String author;
  final double price;
  final double rating;
  final int numberOfPages;
  final String language;
  final String description;
  final String kind;
  final String imageUrl;

  const BookDetailsEntity({
    required this.name,
    required this.author,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.numberOfPages,
    required this.language,
    required this.description,
    required this.kind,
  });

  @override
  List<Object?> get props =>
      [
        name,
        author,
        price,
        imageUrl,
        rating,
        numberOfPages,
        language,
        description,
        kind,
      ];
}
