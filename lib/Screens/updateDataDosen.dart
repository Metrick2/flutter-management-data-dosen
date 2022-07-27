import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/Model/dbDosen.dart';
import 'package:project_uas/Screens/dataDosenDrawer.dart';

class updateDataDosen extends StatefulWidget {
  DosenModel dtDosen;

  @override
  State<StatefulWidget> createState() {
    return updateDataDosenState(dtDosen);
  }

  updateDataDosen(this.dtDosen);
}

Future<DosenModel> updateDataDosens(
    DosenModel dtDosen, BuildContext context) async {
  var Url = "http://10.0.2.2:8080/api/update";
  var response = await http.put(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(dtDosen));
  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: 'Backend Response', content: response.body);
        });
  }
}

class updateDataDosenState extends State<updateDataDosen> {
  DosenModel dtDosen;
  final minimumPadding = 5.0;
  bool _isEnabled = false;
  TextEditingController idDosenController;
  TextEditingController namaController;
  TextEditingController nipController;
  TextEditingController alamatController;
  TextEditingController emailController;
  TextEditingController noTeleponController;
  TextEditingController kodeMataKuliahController;
  TextEditingController bidangController;
  Future<List<DosenModel>> dosens;

  updateDataDosenState(this.dtDosen) {
    idDosenController =
        TextEditingController(text: this.dtDosen.idDosen.toString());
    namaController = TextEditingController(text: this.dtDosen.nama);
    nipController = TextEditingController(text: this.dtDosen.nip);
    alamatController = TextEditingController(text: this.dtDosen.alamat);
    emailController = TextEditingController(text: this.dtDosen.email);
    noTeleponController = TextEditingController(text: this.dtDosen.noTelpon);
    kodeMataKuliahController =
        TextEditingController(text: this.dtDosen.kodeMataKuliah);
    bidangController = TextEditingController(text: this.dtDosen.bidang);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Data Dosen'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => dosenDrawer()));
            },
          ),
        ),
        body: Container(
            child: Padding(
                padding: EdgeInsets.all(minimumPadding * 2),
                child: ListView(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        style: textStyle,
                        controller: namaController,
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
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
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
                        decoration: InputDecoration(
                            labelText: 'Bidang',
                            hintText: 'Enter Your Bidang',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  ElevatedButton(
                      child: Text('Update Details'),
                      onPressed: () async {
                        String nama = namaController.text;
                        String nip = nipController.text;
                        String alamat = alamatController.text;
                        String email = emailController.text;
                        String noTelpon = noTeleponController.text;
                        String kodeMataKuliah = kodeMataKuliahController.text;
                        String bidang = bidangController.text;
                        DosenModel emp = new DosenModel();
                        emp.idDosen = dtDosen.idDosen;
                        emp.nama = namaController.text;
                        emp.nip = nipController.text;
                        emp.alamat = alamatController.text;
                        emp.email = emailController.text;
                        emp.noTelpon = noTeleponController.text;
                        emp.kodeMataKuliah = kodeMataKuliahController.text;
                        emp.bidang = bidangController.text;
                        DosenModel dtDosens =
                            await updateDataDosens(emp, context);
                        setState(() {
                          dtDosen = dtDosens;
                        });
                      })
                ]))));
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
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
