import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testing1/constanta/constant.dart';

class PromoWidget extends StatelessWidget {
  Size size;
  String kotaAsal, kotaTujuan, asal, tujuan;
  int harga, hargaCoret;
  bool dark;
  PromoWidget(
      {this.size,
      this.kotaAsal,
      this.kotaTujuan,
      this.asal,
      this.tujuan,
      this.harga,
      this.hargaCoret,
      this.dark
      });

  final currencyFormatter = NumberFormat('#,##0', 'ID');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: size.width * 0.4,
      margin: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: dark == true ? Constant.grey_dark:Constant.light_purple,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/img/distance.png"),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dari",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Constant.grey,
                            fontSize: 12),
                      ),
                      Text(
                        "$kotaAsal, $asal",
                        style: TextStyle(fontWeight: FontWeight.bold,color:  dark == true ? Colors.white : null),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tujuan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Constant.grey,
                            fontSize: 12),
                      ),
                      Text(
                        "$kotaTujuan, $tujuan",
                        style: TextStyle(fontWeight: FontWeight.bold,color:  dark == true ? Colors.white : null),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            width: size.width * 0.5,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:dark ==true ? Constant.grey_container : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp. ${currencyFormatter.format(hargaCoret)}",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Constant.light_pink),
                ),
                Text(
                  "Rp. ${currencyFormatter.format(harga)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:  dark == true ? Colors.white : Constant.purple,
                      fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
    throw UnimplementedError();
  }
}
