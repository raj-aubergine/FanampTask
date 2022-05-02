class DataModel {
  String? title;
  String? point;
  String? details;

  DataModel({
    this.title,
    this.point,
    this.details,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    title = json['title'];
    point = json['point'];
  }
}
