class Exhibit {
  Exhibit({
    this.title,
    this.images,
  });

  final String? title;
  final List<String>? images;

  Exhibit copyWith({
    String? title,
    List<String>? images,
  }) =>
      Exhibit(
        title: title ?? this.title,
        images: images ?? this.images,
      );

  factory Exhibit.fromJson(Map<String, dynamic> json) => Exhibit(
        title: json["title"] == null ? null : json["title"] as String,
        images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title!,
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
      };
}
