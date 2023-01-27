import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../books/screens/book_screen.dart';
import '../controller/book_provider.dart';

class InfinityBooksList extends StatefulWidget {
  final String search;

  const InfinityBooksList({super.key, this.search = ""});

  @override
  State<InfinityBooksList> createState() => _InfinityBooksListState();
}

class _InfinityBooksListState extends State<InfinityBooksList> {
  int incremental = 0;
  final _lazyController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = Provider.of<BookProvider>(context, listen: false);
      await provider.fetchBooks(widget.search, incremental, true);
    });
    _lazyController.addListener(() async {
      if (_lazyController.position.maxScrollExtent == _lazyController.offset) {
        incremental += 20;
        final provider = Provider.of<BookProvider>(context, listen: false);
        await provider.fetchBooks(widget.search, incremental, false);
      }
    });
  }

  @override
  void dispose() {
    _lazyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<BookProvider>(
      builder: (context, value, child) {
        if (value.books.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            controller: _lazyController,
            itemCount: value.books.length + 1,
            itemBuilder: (context, index) {
              if (index < value.books.length) {
                final book = value.books[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      BookDetailsScreen.routeName,
                      arguments: {
                        "title": book.title,
                        "author": book.author,
                        "image": book.thumbnail,
                        "description": book.description,
                        "selfLink": book.selfLink,
                      },
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(book.title.toString()),
                      subtitle: Text(book.author.toString()),
                      leading: IconButton(
                        icon: book.thumbnail != "assets/no-image-icon-23494.png"
                            ? Image.network(book.thumbnail.toString())
                            : Image.asset("assets/no-image-icon-23494.png"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            });
      },
    ));
  }
}
