class PostFeed {
  final int id;
  final String title;
  final String shortDescription;
  final String description;
  final List<String> tags;

  PostFeed({this.id, this.title, this.shortDescription, this.description, this.tags});

  factory PostFeed.fromJson(Map<String, dynamic> jsonfeed) {

    var list = jsonfeed['tags'] as List;
    List<String> tagsList = list.map((i) => i.toString()).toList();

    return PostFeed(
      id: jsonfeed['id'],
      title: jsonfeed['title'],
      shortDescription: jsonfeed['shortDescription'],
      description: jsonfeed['description'],
      tags: tagsList
    );
  }
}