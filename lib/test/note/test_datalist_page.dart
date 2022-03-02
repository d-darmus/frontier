import 'package:flutter/material.dart';
import 'package:frontier/test/note/test_input_page.dart';
import 'package:frontier/test/note/db/note.dart';
import 'dart:convert';

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
      backgroundColor:const Color.fromARGB(255, 250, 222, 206),
      appBar:AppBar(
        title:const Text('ファイル'),
      ),
      body:Column(
        children:[
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
  Widget dataRow3(int index){
    int _recId = datas[index].recId;
    String _content = datas[index].content;
    return TextButton(
      child:Row(
        children:[
          Container(alignment:Alignment.topLeft,height:70,width:20,margin:const EdgeInsets.only(right:5),color:const Color.fromARGB(136, 241, 95, 85)),
          Expanded(
            child:Container(alignment:Alignment.topLeft,height:70,child:Text('No.$index \nrecId:$_recId , content:$_content',style:const TextStyle(color:Colors.black45)))
          ),
        ]
      ),
      style:TextButton.styleFrom(
        backgroundColor:const Color.fromARGB(255, 238, 174, 169),
        alignment: Alignment.topLeft,
        minimumSize: const Size(10,70),
        side:const BorderSide(color:Color.fromARGB(255, 250, 222, 206)),
        padding:const EdgeInsets.all(0),
      ),
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(
          builder:(context) =>  InputDataPage(recId: _recId)
        ));
      },
    );
  }
  /// データ行Widget
  Widget dataRow(int index){
    int _recId = datas[index].recId;
    String name1 = "";
    String name2 = "";
    List<String> resultt = [];
    List<String> resultb = [];
    try{
      dynamic tmp = jsonDecode(datas[index].content);
      name1 =tmp['name1'];
      name2 =tmp['name2'];
      dynamic tmp2 = jsonDecode(tmp['result']);
      for(int i = 0;i < tmp2.length;i++){
        resultt.add(tmp2[i].toString().split('-')[0]);
        resultb.add(tmp2[i].toString().split('-')[1]);
      }
    }catch(e){
      print(e);
    }
    return TextButton(
      child:Row(
        children:[
          Container(alignment:Alignment.topLeft,height:70,width:20,margin:const EdgeInsets.only(right:5),color:const Color.fromARGB(136, 241, 95, 85)),
          Expanded(
            child:Column(
              mainAxisAlignment:MainAxisAlignment.start,
              children:[
                Container(alignment:Alignment.topLeft,height:20,child:Text('No.'+(index+1).toString(),style:const TextStyle(color:Color.fromARGB(68, 0, 0, 0)))),
                pointRow(resultt,name1,resultb),
                pointRow(resultb,name2,resultt),
              ]
            )
          ),
        ]
      ),
      style:TextButton.styleFrom(
        backgroundColor:const Color.fromARGB(255, 238, 174, 169),
        alignment: Alignment.topLeft,
        minimumSize: const Size(10,70),
        side:const BorderSide(color:Color.fromARGB(255, 250, 222, 206)),
        padding:const EdgeInsets.all(0),
      ),
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(
          builder:(context) =>  InputDataPage(recId: _recId)
        ));
      },
    );
  }
  /// データ取得
  void getDatas() async{
    List<Note> tmp = await Note.getDatas();
    setState((){
      datas = tmp;
    });
  }
  /// 点数行
  static Widget pointRow(List<String> list,String name,List<String> list2){
    Color bordercolor = Color.fromARGB(68, 0, 0, 0);
    int count = 0;
    for(int i = 0; i<list.length; i++){
      if(int.parse(list[i])>int.parse(list2[i])){
        count++;
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Container(alignment:Alignment.center,decoration:BoxDecoration(border:Border(top:BorderSide(color:bordercolor),right:BorderSide(color:bordercolor))),padding:const EdgeInsets.only(right:10),height:25,child:Text(name,style:const TextStyle(color:Colors.black45,fontSize:18))),
        list.isNotEmpty ? Container(alignment:Alignment.center,decoration:BoxDecoration(border:Border(top:BorderSide(color:bordercolor),right:BorderSide(color:bordercolor))),height:25,width:25,child:Text(list[0],style:const TextStyle(color:Colors.black45,fontSize:18))) : const Text(''),
        list.length > 1 ? Container(alignment:Alignment.center,decoration:BoxDecoration(border:Border(top:BorderSide(color:bordercolor),right:BorderSide(color:bordercolor))),height:25,width:25,child:Text(list[1],style:const TextStyle(color:Colors.black45,fontSize:18))) : const Text(''),
        list.length > 2 ? Container(alignment:Alignment.center,decoration:BoxDecoration(border:Border(top:BorderSide(color:bordercolor),right:BorderSide(color:bordercolor))),height:25,width:25,child:Text(list[2],style:const TextStyle(color:Colors.black45,fontSize:18))) : const Text(''),
        list.length > 3 ? Container(alignment:Alignment.center,decoration:BoxDecoration(border:Border(top:BorderSide(color:bordercolor),right:BorderSide(color:bordercolor))),height:25,width:25,child:Text(list[3],style:const TextStyle(color:Colors.black45,fontSize:18))) : const Text(''),
        list.length > 4 ? Container(alignment:Alignment.center,decoration:BoxDecoration(border:Border(top:BorderSide(color:bordercolor),right:BorderSide(color:bordercolor))),height:25,width:25,child:Text(list[4],style:const TextStyle(color:Colors.black45,fontSize:18))) : const Text(''),
        Expanded(child:Container(alignment:Alignment.center,decoration:BoxDecoration(border:Border(top:BorderSide(color:bordercolor),right:BorderSide(color:bordercolor))),height:25,width:25,child:Text(count.toString(),style:const TextStyle(color:Colors.black45,fontSize:18)))),
      ]
    );
  }
}