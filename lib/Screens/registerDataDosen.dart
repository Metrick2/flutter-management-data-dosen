import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/Model/dbDosen.dart';

class registerDataDosen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerDataDosenState();
  }
}

Future<DosenModel> registerDataDosens(
    String nama,
    String nip,
    String alamat,
    String email,
    String noTelpon,
    String kodeMataKuliah,
    String bidang,
    BuildContext context) async {
  var Url = "http://10.0.2.2:8080/api/add";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "nama": nama,
        "nip": nip,
        "alamat": alamat,
        "email": email,
        "noTelpon": noTelpon,
        "kodeMataKuliah": kodeMataKuliah,
        "bidang": bidang,
      }));

  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Response', content: response.body);
      },
    );
  }
}

class registerDataDosenState extends State<registerDataDosen> {
  final minimumPadding = 5.0;

  TextEditingController namaController = TextEditingController();
  TextEditingController nipController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noTeleponController = TextEditingController();
  TextEditingController kodeMataKuliahController = TextEditingController();
  TextEditingController bidangController = TextEditingController();

  DosenModel dosen;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Data Dosen"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: namaController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: nipController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your nip';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'NIP',
                        hintText: 'Enter Your NIP',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: alamatController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your address';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'Enter Your Address',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: emailController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your email';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Your email',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: noTeleponController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your no telphone';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'No Telphone',
                        hintText: 'Enter Your No Telphone',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: kodeMataKuliahController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your kode mata kuliah';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Kode Mata Kuliah',
                        hintText: 'Enter Your Kode Mata Kuliah',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: bidangController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your bidang';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Bidang',
                        hintText: 'Enter Your Bidang',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 2),
                onPressed: () async {
                  String nama = namaController.text;
                  String nip = nipController.text;
                  String alamat = alamatController.text;
                  String email = emailController.text;
                  String noTelpon = noTeleponController.text;
                  String kodeMataKuliah = kodeMataKuliahController.text;
                  String bidang = bidangController.text;
                  DosenModel dosens = await registerDataDosens(nama, nip,
                      alamat, email, noTelpon, kodeMataKuliah, bidang, context);
                  namaController.text = '';
                  nipController.text = '';
                  alamatController.text = '';
                  emailController.text = '';
                  noTeleponController.text = '';
                  kodeMataKuliahController.text = '';
                  bidangController.text = '';
                  setState(() {
                    dosen = dosens;
                  });
                },
                child: Text('submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
