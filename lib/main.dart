import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/setup_service_locator.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/Manager/FeaturedBooks/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/Manager/NewestBooks/newest_books_cubit.dart';
import 'package:bookly/hive/hive_registrar.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SetupServiceLocator().setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  await Hive.openBox<BookEntity>(kSimilarBooks);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // طبعا عملنا كدا عشان دي الهوم فطبيعي تبقي متوفره دايما
        BlocProvider(
          create:
              (context) =>
                  FeaturedBooksCubit(getIt.get<FetchFeaturedBooksUseCase>())
                    ..fetchFeaturedBooksC(),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getIt.get<FetchNewestBooksUseCase>())
                    ..fetchNewestBooksC(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
