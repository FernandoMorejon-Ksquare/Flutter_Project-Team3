class Book {
  Book({
    this.title,
    this.description,
    this.author,
    this.thumbnail,
  });

  String? title;
  String? description;
  String? author;
  String? thumbnail;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["volumeInfo"]["title"],
        description: json["volumeInfo"]["description"] ?? "No description",
        author: json["volumeInfo"]["author"] != null
            ? json["volumeInfo"]["author"][0]
            : "No author",
        thumbnail: json["volumeInfo"]["imageLinks"] != null
            ? json["volumeInfo"]["imageLinks"]["thumbnail"]
            : "assets/no-image-icon-23494.png",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "author": author,
        "thumbnail": thumbnail,
      };
}
