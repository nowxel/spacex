class Mission {
  String missionName = "";
  String details = "";

  Mission(this.missionName, this.details);
  Mission.fromJson(Map<String, dynamic> json)
      : missionName = json['mission_name'] ?? "",
        details = json['details'] ?? "";

  @override
  String toString() => "missionName: $missionName, details: $details";

}