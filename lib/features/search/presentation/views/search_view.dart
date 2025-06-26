import 'package:bookly/core/utils/setup_service_locator.dart';
import 'package:bookly/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/Manager/SearchResult/search_result_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchResultCubit(getIt<SearchRepoImpl>()),
      child: const Scaffold(body: SearchViewBody()),
    );
  }
}

/* 
Plan:
Data layer -> Models,remote,repo
Presentation -> Views(widgets),Manager(Cubits)

models done before//done
remote also done before//done
repo : need new one belong to search//done
views I think it need little effort//done
Manager : I think i can do it also -> if i can Imagine , I can do//done
*/
