import 'package:flutter/material.dart';

class BookCoverWithBackground extends StatelessWidget {
  const BookCoverWithBackground({
    super.key,
    required this.backgroundImage,
    required this.bookCoverImage,
  });

  final String backgroundImage;
  final String bookCoverImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Full-Screen Background Image
        Positioned.fill(
          child: Image.network(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),

        // Dark Overlay for Contrast
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.3)),
        ),

        // Foreground Book Cover
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            bookCoverImage,
            height: 180,
            width: 140,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 180,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Placeholder background
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.broken_image,
                    color: Colors.grey, size: 50),
              );
            },
          ),
        ),
      ],
    );
  }
}
