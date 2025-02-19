import 'package:bookly/core/theming/colors.dart';
import 'package:bookly/core/widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_snakbar.dart';
import '../widgets/book_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, String>> favoriteBooks = [
    {
      'title': 'Book Title 1',
      'description': 'This is a sample description for the book.',
      'date': 'Published: 2023',
      'imageUrl':
      'https://s3-alpha-sig.figma.com/img/7550/f03b/726335f4d8fd52e6d06b9f9440d677f2?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Nq4ngsh8u0yRgVDtgGjNW3gUKgc4~Mt7tHI1tBO8-0P-XEvOYp4DLaJ3596LO7MKsDVF3zXpQacB0dGKlpM0HlejugfgxvuhHXsWqZoP4fQkHjYISxnL2EGPmxyCwd2pWn5JgXPm51HDBWelZ0nok~5HBw4ePaGsCk2XpUPm6ofCRTbU9DD~GRosYZC89HOrKJHAFN7X5XvFYD1TMY0bEQrRfcyUWbxyZvCtbIkV44f8Nx79nN8mtvKaEu3wsT2MUdgEbIQAD2CvdTueyPjDOFIjwccxBHThIPxOvpi2Ui1j~Wk3a0DVglRXoBSxAycgTm-UzBgZdsKUYu3mu5NXOA__', // Replace with actual image URL
    },
    {
      'title': 'Book Title 2',
      'description': 'Another great book to read.',
      'date': 'Published: 2022',
      'imageUrl':
      'https://s3-alpha-sig.figma.com/img/7550/f03b/726335f4d8fd52e6d06b9f9440d677f2?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Nq4ngsh8u0yRgVDtgGjNW3gUKgc4~Mt7tHI1tBO8-0P-XEvOYp4DLaJ3596LO7MKsDVF3zXpQacB0dGKlpM0HlejugfgxvuhHXsWqZoP4fQkHjYISxnL2EGPmxyCwd2pWn5JgXPm51HDBWelZ0nok~5HBw4ePaGsCk2XpUPm6ofCRTbU9DD~GRosYZC89HOrKJHAFN7X5XvFYD1TMY0bEQrRfcyUWbxyZvCtbIkV44f8Nx79nN8mtvKaEu3wsT2MUdgEbIQAD2CvdTueyPjDOFIjwccxBHThIPxOvpi2Ui1j~Wk3a0DVglRXoBSxAycgTm-UzBgZdsKUYu3mu5NXOA__', // Replace with actual image URL
    },
  ];

  void _removeBook(int index) {
    setState(() {
      favoriteBooks.removeAt(index);
    });
    AppSnackBar.show(
      context: context,
      message: 'Book removed from favorites',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:  Text('Favorite Books',style: TextStyles.font24BlackBold,),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      backgroundColor: ColorsManager.offWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: _buildBookList(),
      ),
    );
  }

  Widget _buildBookList() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: favoriteBooks.length,
      separatorBuilder: (context, index) => const AppDivider(),
      itemBuilder: (context, index) {
        final book = favoriteBooks[index];
        return BookItem(
          book: book,
          index: index,
          removeBook: _removeBook,
        );
      },
    );
  }

}