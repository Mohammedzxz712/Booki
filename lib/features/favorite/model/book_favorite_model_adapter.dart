import 'package:bookly/features/home/domain/entities/book_entitie.dart';
import 'package:hive/hive.dart';



class BookModelAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    return BookEntity(
      id: reader.readString(),
      description: reader.readString(),
      title: reader.readString(),
      author: reader.readString(),
      imageUrl: reader.readString(),
      rate: reader.readDouble(),
      price: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.writeString(obj.author);
    writer.writeString(obj.imageUrl);
    writer.writeDouble(obj.rate);
    writer.writeDouble(obj.price);
  }
}
