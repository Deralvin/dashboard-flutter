import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget{
  String menuSrc;
  String title;
  bool dark;
  MenuWidget({this.menuSrc,this.title,this.dark});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
            width: 60.0,
            height: 60.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage(
                        menuSrc)
                )
            )),
        SizedBox(height: 10,),
        Text(title,style: TextStyle(color: dark == true ? Colors.white:null),)
      ],
    );
    throw UnimplementedError();
  }

}