import 'package:flutter/material.dart';
import 'package:frontier/test/note/db/note.dart';

class InputDataPage extends StatefulWidget{
  const InputDataPage({Key? key, required this.recId}) : super(key: key);
  final int recId;
  @override
  State<StatefulWidget> createState(){
    return _InputDataPage();
  }
}
class _InputDataPage extends State<InputDataPage>{
  final TextEditingController _inputDataController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('記録'),
      ),
      body: Column(
        children: [
          0 == widget.recId ? newWidget() : editWidget(),
          Flexible(child: TextField(controller: _inputDataController)), // 入力エリア
        ]
      ),
    );
  }

  /// 編集Widget
  Widget editWidget(){
    return Column(
      children:[
        Container(alignment:Alignment.center,margin:const EdgeInsets.only(top:10,bottom:10), child:const Text('記録'),),
        TextButton(
          child:const Text('保存',style:TextStyle(color:Colors.white)),
          style:TextButton.styleFrom(
            minimumSize:const Size(250,50),
            backgroundColor:Colors.red,
          ),
          onPressed:(){
            updateData();
            Navigator.pop(context);
          },
        ),
        TextButton(
          child:const Text('削除',style:TextStyle(color:Colors.white)),
          style:TextButton.styleFrom(
            minimumSize:const Size(250,50),
            backgroundColor:Colors.redAccent,
          ),
          onPressed:(){
            Note.deleteData(widget.recId);
            Navigator.pop(context);
          },
        ),
        Text('No.'+widget.recId.toString()),
      ]
    );
  }

  /// 新規登録Widget
  Widget newWidget(){
    return Column(
      children:[
        Container(alignment:Alignment.center,margin:const EdgeInsets.only(top:10,bottom:10), child:const Text('記録'),),
        TextButton(
          child:const Text('保存',style:TextStyle(color:Colors.white)),
          style:TextButton.styleFrom(
            minimumSize:const Size(250,50),
            backgroundColor:Colors.red,
          ),
          onPressed:(){
            insertData();
            Navigator.pop(context);
          },
        ),
        const Text('新規登録'),
      ]
    );
  }

  /// データ登録
  void insertData() async{
    Note note = Note(recId: 0,content: _inputDataController.text);
    Note.insertData(note);
  }

  /// データ更新
  void updateData() async{
    Note note = Note(recId: 0,content: _inputDataController.text);
    Note.update(widget.recId,note);
  }
}