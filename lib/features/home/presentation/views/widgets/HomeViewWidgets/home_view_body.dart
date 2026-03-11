import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/Manager/NewestBooks/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/HomeViewWidgets/newest_books_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/HomeViewWidgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/HomeViewWidgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  int pageNumber = 1;
  bool isLoading = false;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(trackScroll);
    super.initState();
  }

  void trackScroll() {
    var currentScroll = scrollController.position.pixels;
    var maxScroll = scrollController.position.maxScrollExtent;

    if (currentScroll >= maxScroll * 0.9) {
      if (!isLoading) {
        isLoading = true;
        context
            .read<NewestBooksCubit>()
            .fetchNewestBooksC(pageNumber: pageNumber++)
            .then((_) {
              if (mounted) setState(() => isLoading = false);
            });
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: CustomScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedBooksListView(),
                SizedBox(height: 50),
                Text('Newest Books', style: Styles.themeStyle),
                SizedBox(height: 20),
              ],
            ),
          ),
          NewestBooksListView(),
        ],
      ),
    );
  }
}
