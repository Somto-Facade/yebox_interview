// To parse this JSON data, do
//
//     final getMatchesRes = getMatchesResFromMap(jsonString);

import 'dart:convert';

GetMatchesRes getMatchesResFromMap(String str) => GetMatchesRes.fromMap(json.decode(str));

String getMatchesResToMap(GetMatchesRes data) => json.encode(data.toMap());

class GetMatchesRes {
  GetMatchesRes({
    required this.count,
    required this.filters,
    required this.competition,
    required this.matches,
  });

  int count;
  Filters filters;
  Competition competition;
  List<Match> matches;

  factory GetMatchesRes.fromMap(Map<String, dynamic> json) => GetMatchesRes(
    count: json["count"],
    filters: Filters.fromMap(json["filters"]),
    competition: Competition.fromMap(json["competition"]),
    matches: List<Match>.from(json["matches"].map((x) => Match.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "filters": filters.toMap(),
    "competition": competition.toMap(),
    "matches": List<dynamic>.from(matches.map((x) => x.toMap())),
  };
}

class Filters {
  Filters();

  factory Filters.fromMap(Map<String, dynamic> json) => Filters(
  );

  Map<String, dynamic> toMap() => {
  };
}
class Competition {
  Competition({
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

  factory Competition.fromMap(Map<String, dynamic> json) => Competition(
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

class Area {
  Area({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Area.fromMap(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}

class Match {
  Match({
    required this.id,
    required this.season,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.group,
    required this.lastUpdated,
    required this.odds,
    required this.score,
    required this.homeTeam,
    required this.awayTeam,
    required this.referees,
  });

  int id;
  Season season;
  DateTime utcDate;
  String status;
  int matchday;
  String stage;
  dynamic group;
  DateTime lastUpdated;
  Odds odds;
  Score score;
  Area homeTeam;
  Area awayTeam;
  List<Referee> referees;

  factory Match.fromMap(Map<String, dynamic> json) => Match(
    id: json["id"],
    season: Season.fromMap(json["season"]),
    utcDate: DateTime.parse(json["utcDate"]),
    status: json["status"],
    matchday: json["matchday"],
    stage: json["stage"],
    group: json["group"],
    lastUpdated: DateTime.parse(json["lastUpdated"]),
    odds: Odds.fromMap(json["odds"]),
    score: Score.fromMap(json["score"]),
    homeTeam: Area.fromMap(json["homeTeam"]),
    awayTeam: Area.fromMap(json["awayTeam"]),
    referees: List<Referee>.from(json["referees"].map((x) => Referee.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "season": season.toMap(),
    "utcDate": utcDate.toIso8601String(),
    "status": status,
    "matchday": matchday,
    "stage": stage,
    "group": group,
    "lastUpdated": lastUpdated.toIso8601String(),
    "odds": odds.toMap(),
    "score": score.toMap(),
    "homeTeam": homeTeam.toMap(),
    "awayTeam": awayTeam.toMap(),
    "referees": List<dynamic>.from(referees.map((x) => x.toMap())),
  };
}

class Odds {
  Odds({
    required this.msg,
  });

  String msg;

  factory Odds.fromMap(Map<String, dynamic> json) => Odds(
    msg: json["msg"],
  );

  Map<String, dynamic> toMap() => {
    "msg": msg,
  };
}

class Referee {
  Referee({
    required this.id,
    required this.name,
    required this.role,
    required this.nationality,
  });

  int id;
  String name;
  String role;
  String? nationality;

  factory Referee.fromMap(Map<String, dynamic> json) => Referee(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    nationality: json["nationality"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "role": role,
    "nationality": nationality,
  };
}

class Score {
  Score({
    required this.winner,
    required this.duration,
    required this.fullTime,
    required this.halfTime,
    required this.extraTime,
    required this.penalties,
  });

  String winner;
  String duration;
  Goals fullTime;
  Goals halfTime;
  Goals extraTime;
  Goals penalties;

  factory Score.fromMap(Map<String, dynamic> json) => Score(
    winner: json["winner"],
    duration: json["duration"],
    fullTime: Goals.fromMap(json["fullTime"]),
    halfTime: Goals.fromMap(json["halfTime"]),
    extraTime: Goals.fromMap(json["extraTime"]),
    penalties: Goals.fromMap(json["penalties"]),
  );

  Map<String, dynamic> toMap() => {
    "winner": winner,
    "duration": duration,
    "fullTime": fullTime.toMap(),
    "halfTime": halfTime.toMap(),
    "extraTime": extraTime.toMap(),
    "penalties": penalties.toMap(),
  };
}

class Goals {
  Goals({
    required this.homeTeam,
    required this.awayTeam,
  });

  int? homeTeam;
  int? awayTeam;

  factory Goals.fromMap(Map<String, dynamic> json) => Goals(
    homeTeam: json["homeTeam"],
    awayTeam: json["awayTeam"],
  );

  Map<String, dynamic> toMap() => {
    "homeTeam": homeTeam,
    "awayTeam": awayTeam,
  };
}

class Season {
  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
  });

  int id;
  String startDate;
  String endDate;
  int currentMatchday;

  factory Season.fromMap(Map<String, dynamic> json) => Season(
    id: json["id"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    currentMatchday: json["currentMatchday"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "startDate": startDate,
    "endDate": endDate,
    "currentMatchday": currentMatchday,
  };
}
class ClubsWithWins{
  int clubId;
  int winNumber;
  ClubsWithWins({required this.winNumber, required this.clubId});
}



