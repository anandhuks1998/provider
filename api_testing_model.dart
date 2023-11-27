class ApiModel {
  final String? title;
  final String? imageurl;
  ApiModel({this.imageurl, this.title});

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      title: json["title"],
      imageurl: json["thumbnailUrl"],
    );
  }
//
}
