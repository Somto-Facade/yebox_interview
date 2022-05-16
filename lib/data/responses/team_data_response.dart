// To parse this JSON data, do
//
//     final teamDataRes = teamDataResFromMap(jsonString);

import 'dart:convert';

import 'matches_response.dart';

TeamDataRes teamDataResFromMap(String str) => TeamDataRes.fromMap(json.decode(str));

String teamDataResToMap(TeamDataRes data) => json.encode(data.toMap());

class TeamDataRes {
  TeamDataRes({
    required this.id,
    required this.area,
    required this.activeCompetitions,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crestUrl,
    required this.address,
    required this.phone,
    required this.website,
    required this.email,
    required this.founded,
    required this.clubColors,
    required this.venue,
    required this.squad,
    required this.lastUpdated,
  });

  int id;
  Area area;
  List<ActiveCompetition> activeCompetitions;
  String name;
  String shortName;
  String tla;
  String crestUrl;
  String address;
  String phone;
  String website;
  String email;
  int founded;
  String clubColors;
  String venue;
  List<Squad> squad;
  DateTime lastUpdated;

  factory TeamDataRes.fromMap(Map<String, dynamic> json) => TeamDataRes(
    id: json["id"],
    area: Area.fromMap(json["area"]),
    activeCompetitions: List<ActiveCompetition>.from(json["activeCompetitions"].map((x) => ActiveCompetition.fromMap(x))),
    name: json["name"],
    shortName: json["shortName"],
    tla: json["tla"],
    crestUrl: json["crestUrl"],
    address: json["address"],
    phone: json["phone"],
    website: json["website"],
    email: json["email"],
    founded: json["founded"],
    clubColors: json["clubColors"],
    venue: json["venue"],
    squad: List<Squad>.from(json["squad"].map((x) => Squad.fromMap(x))),
    lastUpdated: DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "area": area.toMap(),
    "activeCompetitions": List<dynamic>.from(activeCompetitions.map((x) => x.toMap())),
    "name": name,
    "shortName": shortName,
    "tla": tla,
    "crestUrl": crestUrl,
    "address": address,
    "phone": phone,
    "website": website,
    "email": email,
    "founded": founded,
    "clubColors": clubColors,
    "venue": venue,
    "squad": List<dynamic>.from(squad.map((x) => x.toMap())),
    "lastUpdated": lastUpdated.toIso8601String(),
  };
}

class ActiveCompetition {
  ActiveCompetition({
    required this.id,
    required this.area,
    required this.name,
    required this.code,
    required this.plan,
    required this.lastUpdated,
  });

  int id;
  Area area;
  String name;
  String code;
  String plan;
  DateTime lastUpdated;

  factory ActiveCompetition.fromMap(Map<String, dynamic> json) => ActiveCompetition(
    id: json["id"],
    area: Area.fromMap(json["area"]),
    name: json["name"],
    code: json["code"],
    plan: json["plan"],
    lastUpdated: DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "area": area.toMap(),
    "name": name,
    "code": code,
    "plan": plan,
    "lastUpdated": lastUpdated.toIso8601String(),
  };
}

class Squad {
  Squad({
    required this.id,
    required this.name,
    required this.position,
    required this.dateOfBirth,
    required this.countryOfBirth,
    required this.nationality,
    required this.shirtNumber,
    required this.role,
  });

  int id;
  String name;
  String? position;
  DateTime? dateOfBirth;
  String? countryOfBirth;
  String? nationality;
  int? shirtNumber;
  String? role;

  factory Squad.fromMap(Map<String, dynamic> json) => Squad(
    id: json["id"],
    name: json["name"],
    position: json["position"],
    dateOfBirth: json["dateOfBirth"]==null? null: DateTime.parse(json["dateOfBirth"]),
    countryOfBirth: json["countryOfBirth"],
    nationality: json["nationality"],
    shirtNumber: json["shirtNumber"],
    role: json["role"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "position": position,
    "dateOfBirth": dateOfBirth!=null? dateOfBirth!.toIso8601String(): null,
    "countryOfBirth": countryOfBirth,
    "nationality": nationality,
    "shirtNumber": shirtNumber,
    "role": role,
  };
}


