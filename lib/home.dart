import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:veriparki/services/veriler.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VeriParkı',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'IMKB Hisse ve Endeksler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _folded = true;

    late Future<List<ResponseData>> _func;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .02),
                            Image(
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * .15,
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                image: AssetImage('assets/img/giris.png')),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .15)
                          ],
                        ),
                        Text(
                          "VERIPARK\nIMKB HİSSE SENETLERİ/İNDEKSLER",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white70,
                        Colors.grey,
                      ],
                      stops: [
                        0,
                        1.0,
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Hisse ve Endeksler'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    //Navigator.pushNamed(context, "/");
                  },
                ),
                ListTile(
                  title: Text('Yükselenler'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    //Navigator.pushNamed(context, "/hizmetler");
                  },
                ),
                ListTile(
                  title: Text('Düşenler'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    //Navigator.pushNamed(context, "/galeri");
                  },
                ),
                ExpansionTile(
                  title: Text('IMKB Hacme Göre'),
                  trailing: Icon(Icons.arrow_drop_down),
                  children: <Widget>[
                    ListTile(
                      title: Text('IMKB - 30'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        //Navigator.pushNamed(context, "/bizkimiz");
                      },
                    ),
                    ListTile(
                      title: Text('IMKB - 50'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        //Navigator.pushNamed(context, "/tarihcemiz");
                      },
                    ),
                    ListTile(
                      title: Text('IMKB - 100'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        //Navigator.pushNamed(context, "/kurumsal");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * .015),
              AnimatedContainer(
                  curve: Curves.bounceIn,
                  duration: Duration(microseconds: 400),
                  width: _folded
                      ? MediaQuery.of(context).size.width * .17
                      : MediaQuery.of(context).size.width * .95,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: !_folded
                                ? TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Arama',
                                        hintStyle: TextStyle(
                                          color: Colors.red.shade300,
                                        ),
                                        border: InputBorder.none),
                                  )
                                : null)),
                    AnimatedContainer(
                        //curve: Curves.bounceIn,
                        duration: Duration(milliseconds: 400),
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(_folded ? 30 : 0),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(_folded ? 30 : 0),
                                bottomRight: Radius.circular(30),
                              ),
                              onTap: () {
                                setState(() {
                                  _folded = !_folded;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                    _folded ? Icons.search : Icons.close,
                                    color: Colors.red.shade300),
                              )),
                        ))
                  ])),
              SizedBox(height: MediaQuery.of(context).size.height * .02),
                DataTable(
                      columnSpacing: MediaQuery.of(context).size.width * .09,
                      headingRowHeight: MediaQuery.of(context).size.height * .04,
                      headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                      columns: [
                        DataColumn(
                            label: Text('Sembol',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width *
                                        .0275))),
                        DataColumn(
                            label: Text('Fiyat',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width *
                                        .0275))),
                        DataColumn(
                            label: Text('Fark',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width *
                                        .0275))),
                        DataColumn(
                            label: Text('Hacim',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width *
                                        .0275))),
                        DataColumn(
                            label: Text('Alış',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width *
                                        .0275))),
                        DataColumn(
                            label: Text('Satış',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width *
                                        .0275))),
                        DataColumn(
                            label: Text('Değişim',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width *
                                        .0275))),
                      ],
                      rows:[
                        //tablodaki veriler burada olacaktı ancak json verileri buraya entegre edilemedi. aksi taktirde tam olacaktı.
                      ] ),
            ])));
  }}

void displayBottomSheet(BuildContext context) { // tablo istatistiğini göstermek için click ettiğinde gösterecekti.
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Container(
                  child: Center(
                      child: Container(
                color: Colors.grey,
                width: 50,
                height: 3,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              ))),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 2,
                            color: Colors.pink.shade900,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: IconButton(
                                  icon: Icon(Icons.notifications_outlined,
                                      color: Colors.amber),
                                  onPressed: onPressed),
                              title: Text(
                                'Cihan Kuzudişli',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                'iş ilanınızı kabul etti tıklayıp görüşebilirsiniz...',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ])),
                ),
              ),
            ],
          ),
        );
      });
}

void onPressed(){}