// import 'dart:convert';
// import 'package:http/http.dart'

// class BookSearch {
//   static Future<Book> fetchBookById(String id) async {
//     final url = "https://www.googleapis.com/books/books/v1/volumes/$id";

//     Response response = await get(url);
//     var bookMap = await jsonDecode(response.body);
//     return Utils.bookFromJson(bookMap)
//   }
// }