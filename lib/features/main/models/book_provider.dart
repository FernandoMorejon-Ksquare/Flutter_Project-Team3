import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project3_appforbooks/features/main/controller/book_services.dart';
import 'book_model.dart';

class BookProvider extends ChangeNotifier {
  BookProvider(
    this.service,
  );

  final BookServices service;
  List<Book> books = [];

  Future<void> fetchBooks(String search, int index) async {
    final response = await service.getAllBooks(search, index);
    Iterable l = json.decode(response.body)["items"];
    List<Book> _books = List<Book>.from(l.map((model) => Book.fromJson(model)));
    // final _books =
    //     json.decode(response.body).map((data) => Book.fromJson(data)).toList();
    if (books.isEmpty) {
      books = _books;
    } else {
      books.addAll(_books);
    }
    notifyListeners();
  }
}
