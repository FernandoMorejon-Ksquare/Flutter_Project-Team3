import '../models/book_model.dart';
import '../services/book_services.dart';

class BookController {
  List<BookModel> getBooks = [];
  bool isLoading = true;
  BookServices service = BookServices();
  // SearchedBookServices searchedBook = SearchedBookServices();
  void onInit() {
    print("llegamos");
    callBooksList();
    onInit();
  }

  void callBooksList() async {
    try {
      List<BookModel> result = await service.getAllBooks();
      isLoading = true;
      getBooks = result;
      print(getBooks);
    } finally {
      isLoading = false;
    }

    // update(); I think this is state managamente froM GetX. we need to replace this with notifierylisteners.
  }
}
