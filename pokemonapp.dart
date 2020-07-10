import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';
import 'package:pokemonapp/model/pokemonmodel.dart';
import 'package:pokemonapp/ui/newscreen.dart';
class pokemonapp extends StatefulWidget {
  @override
  _pokemonappState createState() => _pokemonappState();
}

class _pokemonappState extends State<pokemonapp> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokemonmodel pokemonmodel;
  @override
  void initState() {
    super.initState();
    fetchData () ;
  }

  fetchData() async {
    var res = await Http.get(url);
    var decodedjson = jsonDecode(res.body);
    pokemonmodel = Pokemonmodel.fromJson(decodedjson);
    print(pokemonmodel.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: pokemonmodel == null?Center(child: CircularProgressIndicator(),):GridView.count(
          crossAxisCount: 2,
          children: pokemonmodel.pokemon.map((pok) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>pokemondetail(
              pokemon: pok,
            )));
          },
          child: Hero(
            tag: pok.img,
            child: Card(
              elevation: 9.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(pok.img))
                    ),
                  ),Text(pok.name,style: TextStyle(
                    fontSize: 20.0,fontWeight: FontWeight.bold

                  ),)
                ],
              ),


            ),
          ),
        ),
      )).toList()
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
