import 'package:flutter/material.dart';
import 'package:pokemonapp/model/pokemonmodel.dart';
import 'package:pokemonapp/ui/pokemonapp.dart';
class pokemondetail extends StatelessWidget {
  final Pokemon pokemon;
  pokemondetail({this.pokemon});
  Widget bodywidget(BuildContext context){
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height/1.5,
width: MediaQuery.of(context).size.width -20,
          left: 10.0,
          top: MediaQuery.of(context).size.height*0.1,
          
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 80.0,),
                Text(pokemon.name,style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                Text("HEIGHT:${pokemon.height}"),
                Text("WEIGHT:${pokemon.weight}"),
                Text("TYPES:"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type.map((t) => FilterChip(backgroundColor:Colors.amber,label: Text(t), onSelected: (b){})).toList(),
                ),
                Text("weakness"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses.map((t) => FilterChip(backgroundColor:Colors.red,label: Text(t,style: TextStyle(
                    color: Colors.white
                  ),), onSelected: (b){})).toList(),
                ),
                Text("next evolution"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution.map((n) => FilterChip(backgroundColor:Colors.green,label: Text(n.name,style: TextStyle(
                      color: Colors.white
                  ),), onSelected: (b){})).toList(),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(tag:pokemon.img,child: Container(
            height: 200.0,
            width: 200,
            decoration: BoxDecoration(

              image: DecorationImage(image: NetworkImage(pokemon.img),fit: BoxFit.cover)
            ),
          ),),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(

        elevation: 0.0,
        title: Text(pokemon.name),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: bodywidget(context),
    );
  }
}

