import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_testing_app/mColors.dart';
import 'package:ui_testing_app/main.dart';
import 'package:ui_testing_app/plant_details.dart';


class PlantWidget extends StatelessWidget {
  Plant plant;
  bool isIconFirst;

  PlantWidget(this.plant, {this.isIconFirst=false});

  @override
  Widget build(BuildContext context) {
    return buildProduct(context);
  }

  Widget buildProduct(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PlantDetails(plant))),
      child: Row(
        children: [
        isIconFirst?Container():buildCard(),
          SizedBox(width: isIconFirst?0:15,),
          buildAddFave(),
          SizedBox(width: isIconFirst?15:0,),
          isIconFirst?buildCard():Container(),
        ],
      ),
    );
  }

  Widget buildCard() {
    return Container(
      height: 320,
      width: 205,
      child: Stack(
        children: [
          Positioned(
            left: 5,
          top: 5,
            child: Container(
              decoration: BoxDecoration(
                color: greenLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                )
              ),
              width: 200,
              height: 300,
            ),
          ),
         Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                )
            ),
            width: 200,
            height: 300,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 25,),
               Center(child: Hero(
                   tag: plant.image,child: Image.asset(plant.image, width: 130, height: 215, ))),
               Padding(
                 padding: const EdgeInsets.only(left:15.0),
                 child: Text(plant.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(width: 15,),
                   Text('\$', style: TextStyle(fontSize: 12, color: textColor),),
                   Text('${plant.price}', style: TextStyle(fontSize: 15, color: textColor),)
                 ],
               )
             ],
           ),
          ),
        ],
      ),
    );
  }

  Widget buildAddFave() {
    return Column(
      children: [
      MIcon(Icons.add, color: textColor,),
        SizedBox(height: 10,),
        MIcon(Icons.favorite_border, color: Colors.black45,)

      ],
    );
  }
}
