import 'package:flutter/material.dart';
import 'package:frontier/test/note/test_input_page.dart';
import 'package:frontier/test/note/db/note.dart';

class DataListPage extends StatefulWidget{
  const DataListPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _DataListPage();
  }
}
class _DataListPage extends State<DataListPage>{
  late List<Note> datas = [];
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    // データ取得
    getDatas();
    return Scaffold(
      appBar:AppBar(
        title:const Text('ファイル'),
      ),
      body:Column(
        children:[
          Container(alignment:Alignment.center,margin:const EdgeInsets.only(top:10,bottom:10), child:const Text('データリスト'),),
          Flexible(
            child:ListView.builder(
              itemCount:datas.length,
              itemBuilder:(BuildContext context,int index){
                return dataRow(index);
              }
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child:const Text('追加',style:TextStyle(color:Colors.white)),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(
            builder:(context) =>  const InputDataPage(recId: 0)
          ));
        },
      ),
    );
  }

  /// データ行Widget
  Widget dataRow(int index){
    int _recId = datas[index].recId;
    String _content = datas[index].content;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Expanded(
          child:Text('No.$index , recId:$_recId , content:$_content'),
        ),
        TextButton(
          child:const Text('編集',style:TextStyle(color:Colors.white)),
          style:TextButton.styleFrom(
            minimumSize:const Size(80,50),
            backgroundColor:Colors.red,
          ),
          onPressed:(){
            Navigator.push(context,MaterialPageRoute(
              builder:(context) =>  InputDataPage(recId: _recId)
            ));
          },
        ),
      ]
    );
  }

  /// データ取得
  void getDatas() async{
    List<Note> tmp = await Note.getDatas();
    setState((){
      datas = tmp;
    });
  }
}