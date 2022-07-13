class NewsModel {
  String? status;
  int? totalResults;
  List<Results>? results;
  int? nextPage;

  NewsModel({this.status, this.totalResults, this.results, this.nextPage});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class Results {
  String? title;
  String? link;
  String? description;
  String? pubDate;
  String? imageUrl;

  Results({
    this.title,
    this.link,
    this.description,
    this.pubDate,
    this.imageUrl,
  });

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    description = json['description'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['description'] = description;
    data['pubDate'] = pubDate;
    data['image_url'] = imageUrl;
    return data;
  }
}
