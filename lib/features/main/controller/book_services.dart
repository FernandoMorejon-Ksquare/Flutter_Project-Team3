import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'alert_manager.dart';

class BookServices {
  Future<Response> getAllBooks(String search, int index) async {
    Uri url = Uri.https("www.googleapis.com", "/books/v1/volumes", {
      "q": search != "" ? search : "action",
      "maxResults": "20",
      "startIndex": "$index",
    });
    Map<String, dynamic> modelObj = {};
    late Response response;
    try {
      response = await http.get(url);
      print(url);
      modelObj = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Add alerts on the UI.

      } else {}
      return response;
    } catch (e) {
      return response;
    }
  }

  loadMore() {
    print("PRINT MORE");
  }

  Future<Map<String, dynamic>> getMoreBooks(context, search) async {
    Uri url = Uri.https("www.googleapis.com", "/books/v1/volumes", {
      "q": search != "" ? search : "action",
      // "maxResults": "$maxResults",
      // "startIndex": "$startIndex",
    });
    Map<String, dynamic> modelObj = {};
    try {
      Response response = await http.get(url);
      print(url);
      modelObj = jsonDecode(response.body);
      if (response.statusCode == 200) {
        AlertManager().displaySnackBar(context, "Books successfully loaded");
      } else {
        AlertManager().displaySnackBar(context, "Something went wrong");
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }
}
