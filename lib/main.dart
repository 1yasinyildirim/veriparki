import 'package:flutter/material.dart';
import 'package:veriparki/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * .25,
                        height: MediaQuery.of(context).size.height * .25,
                        image: AssetImage('assets/img/giris.png')),
                    SizedBox(width: MediaQuery.of(context).size.width * .09),
                    Text('VERİPARK',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: MediaQuery.of(context).size.width * 0.1))
                  ],
                ),
                RaisedButton(
                    
                    child: Text(
                      "IMKB Hisse Senetleri/Endeksler",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    }),
              ],
            )));
  }
}
