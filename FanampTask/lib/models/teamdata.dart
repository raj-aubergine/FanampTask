class TeamDataModel {
  late int id;
  late String logo;
  late String name;

  TeamDataModel({
    required this.id,
    required this.logo,
    required this.name,
  });

  TeamDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    logo = json['logo'];
    name = json['name'];
  }
}
