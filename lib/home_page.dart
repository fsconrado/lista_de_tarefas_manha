import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(child: TextField(),),
                RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("ADD",),
                    textColor: Colors.white,
                    onPressed: (){})
              ],
            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
                return Text("Fabiano $index");
              }))
        ],
      ),
    );
  }

  //Metodo para achar o caminho do arquivo no celular
  Future<File> _pegarArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/arquivo.json");
  }

//Metodo para Salvar no Arquivo
  Future<File> _saveArquivo() async {
    String dados = json.encode(_toDoList);
    final arquivo = await _pegarArquivo();
    return arquivo.writeAsString(dados);
  }

//Metodo para Ler o arquivo
  Future<String> _lerArquivo() async {
    try {
      final arquivo = await _pegarArquivo();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }
}
