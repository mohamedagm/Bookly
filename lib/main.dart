import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/setup_service_locator.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/Manager/FeaturedBooks/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/Manager/NewestBooks/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SetupServiceLocator().setupServiceLocator();
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
                  FeaturedBooksCubit(getIt<HomeRepoImpl>())
                    ..fetchFeaturedBooksC(),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getIt<HomeRepoImpl>())..fetchNewestBooksC(),
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
