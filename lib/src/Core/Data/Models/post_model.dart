class PostModel {
  final String? imgAddress;
  final String authorImgAddress;
  final String author;
  final String date;
  final String? imgUrl;
  final String title;
  final String description;

  PostModel({
    required this.authorImgAddress,
    required this.imgAddress,
    required this.author,
    required this.date,
    required this.imgUrl,
    required this.title,
    required this.description,
  });
}
