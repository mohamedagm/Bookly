import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                HorizontalListView(),
                SizedBox(height: 50),
                Text('Best Seller', style: Styles.themeStyle),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverFillRemaining(child: BestSellerListView()),
        ],
      ),
    );
  }
}

// SliverToBoxAdapter(child: BestSellerListView()),
