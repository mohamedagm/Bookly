import 'package:bookly/features/search/presentation/Manager/SearchResult/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () async {
            if (controller.text.isNotEmpty) {
              await BlocProvider.of<SearchResultCubit>(
                context,
              ).fetchResultBooksC(query: controller.text);
            }

            controller.clear();
          },
          icon: const Icon(Icons.search),
        ),
        border: outLineBorder(),
        enabledBorder: outLineBorder(),
      ),
    );
  }
}

OutlineInputBorder outLineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.white),
  );
}
