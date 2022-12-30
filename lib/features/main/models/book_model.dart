// REMEMBER TO DELETE PRINTS AND UPDATE MODEL.
class BookModel {
  String? title;
  String? author;
  String? description;
  String? thumbnailUrl;

  BookModel({this.title, this.author, this.description, this.thumbnailUrl});

  BookModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "Titulo #1";
    author = json['authors'][0] ?? "Autor #1";
    thumbnailUrl =
        json['imageLinks']["smallThumbnail"] ?? "https://picsum.photos/200";
    description = json['description'] ?? "descripcion #1";
    print(title);
    print(author);
    print(thumbnailUrl);
  }
}
