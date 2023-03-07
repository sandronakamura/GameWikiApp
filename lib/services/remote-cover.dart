import 'package:game_wiki_app/model/games_cover.dart';
import 'package:http/http.dart' as http;

import '../model/games_rated.dart';

class RemoteCover {

  Future sendConver(gamesRated) async{
    List<String> gamesId = [];
    List<GamesCover>? gamesCover = [];
    List<String> gamesCoverId = [];

    String gameCode;

    for (GamesRated game in gamesRated) {
      gameCode = game.cover.toString();
      gamesId.add(gameCode);
    }
    gamesCover = await getCovers(gamesId);

    for (GamesCover cover in gamesCover!) {
      gameCode = cover.imageId.toString();
      gamesCoverId.add(gameCode);
    }
    return gamesCoverId;
  }

  Future<List<GamesCover>?> getCovers(ids) async {

    var uri = Uri.parse('https://api.igdb.com/v4/covers');
    var headers = {
      'Content-Type': 'application/json',
      'Client-ID': 'qxv3azm4elfwe22om006fhrkhcqb8j',
      'Authorization': 'Bearer 3pgr27fzon78btfcfw9bm04k6cl21f',
    };

    String stringList = ids.join(",");
    int numberOfCovers = ids.length;

    var body =  'fields image_id ; limit $numberOfCovers;where id = (${stringList});';

    var request = http.Request('POST', uri);
    request.body = body;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return gamesCoverFromJson(json);

    } else {
      print('Não retornou capas');
    }
  }

}