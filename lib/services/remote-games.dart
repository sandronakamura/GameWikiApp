import 'package:game_wiki_app/model/games_rated.dart';
import 'package:http/http.dart' as http;

class RemoteGames {
  Future<List<GamesRated>?> getGames() async {

    var uri = Uri.parse('https://api.igdb.com/v4/games');
    var headers = {
      'Content-Type': 'application/json',
      'Client-ID': 'qxv3azm4elfwe22om006fhrkhcqb8j',
      'Authorization': 'Bearer 3pgr27fzon78btfcfw9bm04k6cl21f',
    };
    var body =  'fields name,created_at,cover, summary, rating; sort rating desc; limit 100; where cover != null;';

    var request = http.Request('POST', uri);
    request.body = body;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      return gamesRatedFromJson(json);
    } else {
      print('Não retornou jogos');
    }
  }

}