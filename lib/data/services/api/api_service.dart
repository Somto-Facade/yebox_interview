import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:yebox_interview/data/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:yebox_interview/data/responses/matches_response.dart';
import 'package:yebox_interview/data/responses/team_data_response.dart';
import 'package:yebox_interview/data/services/dialog.dart';
import 'package:yebox_interview/di/get_it.dart';

abstract class ApiService {
  Future<TeamDataRes?> getMatches();
  Future<TeamDataRes?> getTeamData({required int clubId});
}

class ApiServiceImpl extends ApiService {

  @override
  Future<TeamDataRes?> getMatches() async{
    String dateFrom = DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(const Duration(days: 30)));
    String dateTo = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String url = ApiConstants.hostLink + ApiConstants.matches + "dateFrom=$dateFrom&dateTo=$dateTo";
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "X-Auth-Token": ApiConstants.apiKey
      });
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        GetMatchesRes getMatchesRes = getMatchesResFromMap(response.body);
        List<ClubsWithWins> clubsWithWins = [];
        Map<int, int> clubsMap = {};
        List<dynamic>.from(getMatchesRes.matches.map((x) {
          if (x.score.fullTime.awayTeam! > x.score.fullTime.homeTeam!) {
            clubsMap[x.awayTeam.id] == null
                ? clubsMap[x.awayTeam.id] = 1
                : clubsMap[x.awayTeam.id] = clubsMap[x.awayTeam.id]! + 1;
          } else if (x.score.fullTime.homeTeam! > x.score.fullTime.awayTeam!) {
            clubsMap[x.homeTeam.id] == null
                ? clubsMap[x.homeTeam.id] = 1
                : clubsMap[x.homeTeam.id] = clubsMap[x.homeTeam.id]! + 1;
          }
        }));
        clubsMap.forEach((key, value) {
          clubsWithWins.add(ClubsWithWins(winNumber: value, clubId: key));
        });
        clubsWithWins.sort((b, a) =>
        a.winNumber != b.winNumber ? a.winNumber.compareTo(b.winNumber) : b
            .clubId.compareTo(a.clubId));
        TeamDataRes? teamDataRes = await getTeamData(clubId: clubsWithWins[0].clubId);
        return teamDataRes;
      } else if (response.statusCode == 422) {
        List<dynamic> errors =
        Map
            .from(decodedResponse["errors"])
            .keys
            .toList()
            .map((errorItem) {
          List<dynamic> errorsForItem = decodedResponse["errors"][errorItem];
          return errorsForItem.join(" ");
        }).toList();
        getItInstance<DialogServicesImpl>().errorMessageDialog(errorMessage: errors.join("\n"));
        return null;
      } else {
        getItInstance<DialogServicesImpl>().errorMessageDialog(errorMessage: 'Sorry, \nCannot get matches data');
        return null;
      }
    }catch(e){
      getItInstance<DialogServicesImpl>().errorMessageDialog(errorMessage: 'Sorry, \nCannot get matches data');
      return null;
    }
  }

  @override
  Future<TeamDataRes?> getTeamData({required int clubId}) async{
    String url = ApiConstants.hostLink + ApiConstants.teamData + clubId.toString();
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "X-Auth-Token": ApiConstants.apiKey
      });
      Map<String, dynamic> decodedResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        TeamDataRes teamDataRes = TeamDataRes.fromMap(decodedResponse);
        return teamDataRes;
      } else if (response.statusCode == 422) {
        List<dynamic> errors =
        Map.from(decodedResponse["errors"]).keys.toList().map((errorItem) {
          List<dynamic> errorsForItem = decodedResponse["errors"][errorItem];
          return errorsForItem.join(" ");
        }).toList();
        getItInstance<DialogServicesImpl>().errorMessageDialog(errorMessage: errors.join("\n"));
        return null;
      } else {
        getItInstance<DialogServicesImpl>().errorMessageDialog(errorMessage: 'Sorry, \nCannot get team data');
        return null;
      }
    }catch(e) {
      getItInstance<DialogServicesImpl>().errorMessageDialog(errorMessage: 'Sorry, \nCannot get team data');
      return null;
    }
  }
}
