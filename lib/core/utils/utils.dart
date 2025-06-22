import '../../features/home/presentation/controller/home_event.dart';
import '../../features/onBoarding/data/model/onBoarding_model.dart';
import '../network/api_constant.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(title: 'welcom to booki ',
      description: '"Books Provide Knowledge And Inspiration,\n'
          'And Our Program Makes It Easy To Access\n'
          'Them And Grow Your Skills."',
      image: 'assets/images/onBoarding1.png'),
  OnBoardingModel(title: 'anytime, anywhere',
      description:'"Books Are Vital For Learning And Creativity,\nAnd Our Program Makes Access \nEasy While Supporting Your Intellectual \nGrowth."',
      image: 'assets/images/onBoarding2.png'),
  OnBoardingModel(title: 'Books nourish the mind',
      description: '"Books Fuel The Mind And Spark Creativity,\nAnd Our Program Makes Access Easy \nWhile Helping You Manage Time For \nProgress."',
      image: 'assets/images/onBoarding3.png'),
];

enum EnState { loading , loaded , error }

final categories = [
  {'label': 'Fantasy', 'event': GetBookHomeEvent(ApiConstance.fantasyBooks)},
  {'label': 'Romance', 'event': GetBookHomeEvent(ApiConstance.getBooks)},
  {'label': 'Mystery', 'event': GetBookHomeEvent(ApiConstance.mysteryBooks)},
  {'label': 'Biographies', 'event': GetBookHomeEvent(ApiConstance.biographyBooks)},
];

final secondaryCategories = [
  {'label': 'Latest', 'event': GetBookHomeBestSellerEvent(ApiConstance.latestBooks)},
  {'label': 'Best Seller', 'event': GetBookHomeBestSellerEvent(ApiConstance.bestsellerBooks)},
  {'label': 'Top Rated', 'event': GetBookHomeBestSellerEvent(ApiConstance.topRated)},
  {'label': 'Most Popular', 'event': GetBookHomeBestSellerEvent(ApiConstance.popularBooks)},
];