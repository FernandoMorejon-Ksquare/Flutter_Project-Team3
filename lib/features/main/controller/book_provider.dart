import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/controller/book_services.dart';
import '../models/book_model.dart';

class BookProvider extends ChangeNotifier {
  BookProvider(
    this.service,
    this.isSearching,
  );

  final BookServices service;
  bool isSearching;
  List<Book> books = [];

  Future<void> fetchBooks(String search, int index, bool isSearching) async {
    final response = await service.getAllBooks(search, index);
    Iterable l = json.decode(response.body)["items"];
    if (isSearching) {
      books.clear();
      isSearching = false;
    }
    // ignore: no_leading_underscores_for_local_identifiers
    List<Book> _books = List<Book>.from(l.map((model) => Book.fromJson(model)));
    if (books.isEmpty) {
      books = _books;
    } else {
      books.addAll(_books);
    }
    notifyListeners();
  }
}
