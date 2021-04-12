import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing1/constanta/constant.dart';
import 'package:testing1/models/jurusan_model.dart';
import 'package:http/http.dart' as http;
import 'package:testing1/view/widgets/menu_widget.dart';
import 'package:testing1/view/widgets/promo_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool darkToogle = false;
  String url = "https://web.aotransportbus.com/api/testing/promo-list";
  List<JurusanModel> promoData = [];

  Future<JurusanModel> fetchJurusan() async {
    final response = await http.get(url);
    final data = jurusanModelFromJson(response.body);
    setState(() {
      data.forEach((element) {
        promoData.add(new JurusanModel(
            asal: element.asal,
            harga: element.harga,
            hargaCoret: element.hargaCoret,
            kotaAsal: element.kotaAsal,
            kotaTujuan: element.kotaTujuan,
            tujuan: element.tujuan));
      });
    });

    print(jurusanModelFromJson(response.body));
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchJurusan();
    super.initState();
  }

  void changeTheme(bool value) {
    setState(() {
      darkToogle = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:
            darkToogle == true ? Constant.dark_bg : Constant.bg_color,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                        decoration: InputDecoration(
                          fillColor: darkToogle == true ? Colors.white : null,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          hintText: "Cari Promo, Keberangkatan dsb",
                          suffixIcon: Icon(
                            Icons.search,
                            color: Constant.purple,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 10.0),
                        ),
                        textAlign: TextAlign.left,
                        cursorColor: Constant.purple,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Siang Alvin !",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: darkToogle == true
                                    ? Colors.white
                                    : Constant.purple),
                          ),
                        ),
                        Switch(
                          value: darkToogle,
                          onChanged: (value) {
                            changeTheme(value);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "semoga hari mu menyenangkan",
                      style: TextStyle(
                          color: darkToogle == true
                              ? Colors.white
                              : Constant.greysub,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MenuWidget(
                            menuSrc: "assets/img/travel.png",
                            title: "Travel",
                            dark: darkToogle,
                          ),
                        ),
                        Expanded(
                          child: MenuWidget(
                            menuSrc: "assets/img/paket.png",
                            title: "Paket",
                            dark: darkToogle,
                          ),
                        ),
                        Expanded(
                          child: MenuWidget(
                            menuSrc: "assets/img/pariwisata.png",
                            title: "Pariwisata",
                            dark: darkToogle,
                          ),
                        ),
                        Expanded(
                          child: MenuWidget(
                            menuSrc: "assets/img/outlet.png",
                            title: "Outlet",
                            dark: darkToogle,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color:darkToogle == true ?Constant.grey_dark : Color(0xfff1f1f1),
                      thickness: 3,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset("assets/img/banner.png"),
                        )),
                    Divider(
                      color:darkToogle == true ?Constant.grey_dark : Color(0xfff1f1f1),
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Promo Buat Kamu",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: darkToogle == true? Colors.white:null),
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: size.width * 0.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: promoData.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return PromoWidget(
                              dark: darkToogle,
                              size: size,
                              asal: promoData[index].asal,
                              tujuan: promoData[index].tujuan,
                              kotaAsal: promoData[index].kotaAsal,
                              kotaTujuan: promoData[index].kotaTujuan,
                              harga: promoData[index].harga,
                              hargaCoret: promoData[index].hargaCoret,
                            );
                          },
                        ))
                  ],
                )),
          ),
        ));
    throw UnimplementedError();
  }
}
