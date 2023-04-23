import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluuter_json_parse/Mesajlar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void mesajParse() {
    String strVeri = '{"mesajlar": {"mesaj_kod":1,"mesaj_icerik":"başarılı"}}';

    var jsonVeri = json.decode(strVeri);

    var jsonNesne = jsonVeri["mesajlar"];

    var mesaj = Mesajlar.fromJson(jsonNesne);

    print("Mesaj kodu: ${mesaj.mesaj_kod}");
    print("Mesaj içerik: ${mesaj.mesaj_icerik}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mesajParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parse "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Json parse kullanımı"),
          ],
        ),
      ),
    );
  }
}
