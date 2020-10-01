

import 'package:flutter/material.dart';
import 'package:ui_testing_app/main.dart';

import 'mColors.dart';

class PlantDetails extends StatelessWidget {
  Plant plant;
  BuildContext context;
  PlantDetails(this.plant);

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            buildToolBar(),
            buildPlantPrice(),
            SizedBox(height: 20,),
            buildPlantDetails(),
            SizedBox(height: 20,),
            buildCenterBody(),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text('Related', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
            SizedBox(height: 10,),

            Container(
              height: 100,
              padding: EdgeInsets.only(left: 40),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildImage('image/directory'),
                  buildImage('image/directory'),
                  buildImage('image/directory'),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildToolBar() {
    return Row(
      children: [
      SizedBox(width: 30,
      ),
        buildBackIcon(),
        SizedBox(width: 20,),
        Text(plant.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
      ],
    );
  }

  Widget buildBackIcon() {
    return InkWell(
      onTap: ()=>Navigator.of(context).pop(),
      child: Card(
        shadowColor: greenLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Container(
          width: 50,
          height: 50,
          child: Center(child: Image.asset('image/name', width: 20,)),
        ),
      ),
    );
  }

  Widget buildPlantPrice() {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100+10.0,),
        Text('\$', style: TextStyle(fontSize: 15, color: textColor),),
        Text('${plant.price}', style: TextStyle(fontSize: 20, color: textColor),)
      ],
    );
  }

  Widget buildPlantDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildDetailsText('Size', 'Medium 14' ),
        buildDetailsText('Crust', 'Metal' ),
        buildDetailsText('Delivery', '30min' ),
      ],
    );
  }

  Widget buildDetailsText(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(color: Colors.grey),),
        Text(value,style: TextStyle(fontSize: 16),),
      ],
    );
  }

 Widget buildCenterBody() {
    return Row(
      children: [
     Column(
       children: [
         MIcon(Icons.share),
         MIcon(Icons.favorite_border, color: Colors.grey,),
         SizedBox(height: 30,),
         buildContainerPlaceOrder()
       ],
     ),
        SizedBox(width: 30,),
        buildCard()
      ],
    );
 }

 Widget buildContainerPlaceOrder() {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        width: 144,
        height: 90,
        color: greenLight,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Icon(Icons.keyboard_arrow_up),
            SizedBox(height: 10,),
            Text('Place Order'),
          ],
        ),
      ),
    );
 }
  Widget buildCard() {
    return Container(
      height: 380,
      width: 250,
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
              width: 250,
              height: 380,
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
            width: 250,
            height: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Center(child: Hero(
                    tag: plant.image,child: Image.asset(plant.image, width: 200, height: 350, ))),

              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget buildImage(String image) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Image.asset(image, width: 85, height: 85,),
    );
 }
}
