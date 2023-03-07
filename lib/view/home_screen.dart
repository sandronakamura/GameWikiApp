import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/services/remote-games.dart';
import 'package:game_wiki_app/services/remote-cover.dart';
import 'package:game_wiki_app/view/authentication_screen.dart';

import '../model/games_rated.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GamesRated>? gamesRated;
  List<String>? gamesCover;

  var isLoaded = false;
  var numberOfGames = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Retornando dados da API
    getData();

  }

  getData() async{

    try {

      gamesRated = await RemoteGames().getGames();
      gamesCover = await RemoteCover().sendConver(gamesRated);
      numberOfGames = gamesRated!.length;

      if(gamesRated != null) {
        setState(() {
          isLoaded = true;
        });
      }


    } catch(e) {
      print(e);
    }


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: const Center(
          child: Text(
              'GAME WIKI',
              style: TextStyle(
                color: Colors.white,
              ),
          ),
        ),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],

      ),
      body: ListView.separated(
        itemCount: numberOfGames,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 75,
                    decoration: const BoxDecoration(
                    ),
                    child: Image.network('https://images.igdb.com/igdb/image/upload/t_cover_big/${gamesCover?[index]}.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gamesRated?[index].name ?? '',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          gamesRated?[index].summary ?? 'No Summary',
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        separatorBuilder: (context, index) => const Divider(
          color: Colors.white,
        ),
      ),
    );
  }

  logout () async{

    
    await FirebaseAuth.instance.signOut();

    // ignore: use_build_context_synchronously
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen())
    );

  }
}
