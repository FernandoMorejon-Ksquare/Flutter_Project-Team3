import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/models/home_model.dart';
import 'package:project3_appforbooks/features/main/screens/home_screen.dart';
import 'package:project3_appforbooks/features/main/screens/infinity_books_list.dart';

class SearchManager extends SearchDelegate {
  @override
  Widget buildResults(BuildContext context) {
    // return Container();
    return InfinityBooksList(search: query);
    // return HomeModel().homeModel(context, query, ScrollController());
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("");
  }
}
