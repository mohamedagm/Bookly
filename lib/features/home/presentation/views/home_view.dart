import 'package:flutter/material.dart';
import 'package:bookly/features/home/presentation/views/widgets/HomeViewWidgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}
