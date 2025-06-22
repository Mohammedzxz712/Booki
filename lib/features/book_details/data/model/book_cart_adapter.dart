import 'package:hive/hive.dart';

import '../../domain/entity/book_details_entity.dart';

class BookDetailsEntityAdapter extends TypeAdapter<BookDetailsEntity> {
  @override
  final int typeId = 1; // غير الرقم لو عندك TypeAdapters أخرى

  @override
  BookDetailsEntity read(BinaryReader reader) {
    return BookDetailsEntity(
      name: reader.readString(),
      author: reader.readString(),
      imageUrl: reader.readString(),
      price: reader.readDouble(),
      rating: reader.readDouble(),
      numberOfPages: reader.readInt(),
      language: reader.readString(),
      description: reader.readString(),
      kind: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, BookDetailsEntity obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.author);
    writer.writeString(obj.imageUrl);
    writer.writeDouble(obj.price);
    writer.writeDouble(obj.rating);
    writer.writeInt(obj.numberOfPages);
    writer.writeString(obj.language);
    writer.writeString(obj.description);
    writer.writeString(obj.kind);
  }
}
