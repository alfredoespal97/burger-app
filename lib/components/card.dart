import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CardItem extends StatelessWidget {
  final String image;
  final String name;
  const CardItem({Key? key, required this.image,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(15),
        elevation: 10,

        // Dentro de esta propiedad usamos ClipRRect
        child: ClipRRect(

          // Los bordes del contenido del card se cortan usando BorderRadius
          borderRadius: BorderRadius.circular(30),

          // EL widget hijo que será recortado segun la propiedad anterior
          child: Column(
            children: <Widget>[

              // Usamos el widget Image para mostrar una imagen
              Hero(
                tag: this.image,
                child: CachedNetworkImage(
                  //height: MediaQuery.of(context).size.height/6,
                  imageUrl: this.image,
                  fit: BoxFit.fitHeight,
                ),
              ),

              // Usamos Container para el contenedor de la descripción
              Container(
                padding: EdgeInsets.all(10),
                child: Text(this.name, style: TextStyle(color:ksecondaryColor,fontSize: 14,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ));
  }
}

