class Book {
  Book({
    this.title,
    this.description,
    this.author,
    this.thumbnail,
    this.selfLink,
  });

  String? title;
  String? description;
  String? author;
  String? thumbnail;
  String? selfLink;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["volumeInfo"]["title"],
        description: json["volumeInfo"]["description"] ?? "No description",
        author: json["volumeInfo"]["authors"] != null
            ? json["volumeInfo"]["authors"][0]
            : "No author",
        thumbnail: json["volumeInfo"]["imageLinks"] != null
            ? json["volumeInfo"]["imageLinks"]["thumbnail"]
            : "assets/no-image-icon-23494.png",
        selfLink: json["selfLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "author": author,
        "thumbnail": thumbnail,
        "selfLink": selfLink,
      };
}
