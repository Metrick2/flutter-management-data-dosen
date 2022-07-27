import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/Model/dbDosen.dart';
import 'package:project_uas/Screens/deleteDataDosen.dart';
import 'package:project_uas/Screens/dataDosenDrawer.dart';
import 'package:project_uas/Screens/updateDataDosen.dart';

class getDataDosens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return getAllDataDosenState();
  }
}

class getAllDataDosenState extends State<getDataDosens> {
  var dtDosens = List<DosenModel>.generate(200, (index) => null);

  Future<List<DosenModel>> getListDataDosen() async {
    var data = await http.get('http://10.0.2.2:8080/api/getData');
    var jsonData = json.decode(data.body);

    List<DosenModel> dataDosen = [];
    for (var e in jsonData) {
      DosenModel dosenModels = new DosenModel();
      dosenModels.idDosen = e["idDosen"];
      dosenModels.nama = e["nama"];
      dosenModels.nip = e["nip"];
      dosenModels.alamat = e["alamat"];
      dosenModels.email = e["email"];
      dosenModels.noTelpon = e["noTelpon"];
      dosenModels.kodeMataKuliah = e["kodeMataKuliah"];
      dosenModels.bidang = e["bidang"];
      dataDosen.add(dosenModels);
    }
    return dataDosen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("All Data Dosen Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => dosenDrawer()));
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getListDataDosen(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Icon(Icons.error)));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title:
                        Text('Nama' + ' | ' + 'NIP' + ' | ' + 'Bidang' + ' '),
                    subtitle: Text('${snapshot.data[index].nama}' +
                        ' | ' +
                        '${snapshot.data[index].nip}' +
                        ' | ' +
                        '${snapshot.data[index].bidang}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  DosenModel dosen;

  DetailPage(this.dosen);
  final minimumPadding = 5.0;
  bool _isEnabled = false;

  deleteDataDosen1(DosenModel dosens, BuildContext context) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/delete');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(dosens);
    final response = await request.send();
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(
              title: 'Backend Response',
              content: 'Success Delete Data',
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController namaController =
        TextEditingController(text: this.dosen.nama);
    TextEditingController nipController =
        TextEditingController(text: this.dosen.nip);
    TextEditingController alamatController =
        TextEditingController(text: this.dosen.alamat);
    TextEditingController emailController =
        TextEditingController(text: this.dosen.email);
    TextEditingController noTelponController =
        TextEditingController(text: this.dosen.noTelpon);
    TextEditingController kodeMataKuliahController =
        TextEditingController(text: this.dosen.kodeMataKuliah);
    TextEditingController bidangController =
        TextEditingController(text: this.dosen.bidang);

    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text(dosen.nama),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => updateDataDosen(dosen)));
              })
        ],
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
                      readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
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
                      controller: noTelponController,
                      readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: 'Bidang',
                          hintText: 'Enter Your Bidang',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
              ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deleteDataDosen1(dosen, context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => deleteDataDosen()));
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
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
