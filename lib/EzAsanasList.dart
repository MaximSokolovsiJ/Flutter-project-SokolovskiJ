import 'package:flutter/material.dart';
import 'package:sokolovskij_app/EzAsanasData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EzAsanasList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return EzAsanasListState();
  }
}

class EzAsanasListState extends State<EzAsanasList>{
  List<EzAsanasData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EzAsanas 2 Relax'),
        ),
        body:
        Container(
            child: ListView(
                children: _buildList()
            )

        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Show'),
          onPressed: () => _loadEzAsanas(),
        ),

    );
  }

  _loadEzAsanas() async{
    final response = await http.get('https://my-json-server.typicode.com/MaximSokolovsiJ/yoga-asanas-json/db');
    if(response.statusCode == 200){
      print(response.body);
      var allData = (json.decode(response.body) as Map)['asanas'] as Map<String, dynamic>;

      var EzAsanasDataList = List<EzAsanasData>();
      allData.forEach((String key, dynamic val){
        var record = EzAsanasData( id:val['id'], title: val['title'], url: val['url']);

        EzAsanasDataList.add(record);
      });
      setState((){
        data = EzAsanasDataList;
      });

    }
  }

  List<Widget> _buildList(){
    return data.map((EzAsanasData f) => ListTile(
      title: Text(f.title),
      leading: CircleAvatar(
          child: Text(f.id.toString())),
    )).toList();
  }

}