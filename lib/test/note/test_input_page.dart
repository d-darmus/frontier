import 'package:flutter/material.dart';
import 'package:frontier/test/note/db/note.dart';
import 'package:frontier/basis/utilities/utilities.dart';

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
  final TextEditingController _inputDataController2 = TextEditingController();
  String gameResStr = "";
  List<String> gameResStrList = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('記録'),
      ),
      body: SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: Column(
          children: [
            0 == widget.recId ? newWidget() : editWidget(), // 新規登録or編集
            pointSheet(), // 表示
            inputArea(),  // 入力エリア
          ]
        ),
      ),
    );
  }

  /// 入力Widget
  Widget inputArea(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Text(gameResStr),
        caluculateBox(),
      ],
    );
  }  
  /// 電卓エリア
  Widget caluculateBox(){
    return Container(
      alignment:Alignment.center,
      color:Colors.white,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Expanded(child:
                Column(
                  children:[
                    TextButton(child:const Text('7',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='7';});
                    }),
                    TextButton(child:const Text('4',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='4';});
                    }),
                    TextButton(child:const Text('1',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='1';});
                    }),
                    TextButton(child:const Text('C',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr='';});
                    }),
                  ]
                )
              ),
              Expanded(child:
                Column(
                  children:[
                    TextButton(child:const Text('8',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='8';});
                    }),
                    TextButton(child:const Text('5',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='5';});
                    }),
                    TextButton(child:const Text('2',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='2';});
                    }),
                    TextButton(child:const Text('0',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='0';});
                    }),
                  ]
                )
              ),
              Expanded(child:
                Column(
                  children:[
                    TextButton(child:const Text('9',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='9';});
                    }),
                    TextButton(child:const Text('6',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='6';});
                    }),
                    TextButton(child:const Text('3',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='3';});
                    }),
                    TextButton(child:const Text('B',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr=Utilities.backSpace(gameResStr);});
                    }),
                  ]
                )
              ),
              Expanded(child:
                Column(
                  children:[
                    TextButton(child:const Text('-',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,60),backgroundColor:Colors.red),onPressed:(){
                      setState((){gameResStr+='-';});
                    }),
                    TextButton(child:const Text('Next\ngame\n↵',style:TextStyle(color:Colors.white)),style:TextButton.styleFrom(minimumSize: const Size(90,180),backgroundColor:Colors.red),onPressed:(){
                      bool inputCheck1 = gameResStr.isNotEmpty;
                      if(!inputCheck1){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('エラー!!!')));
                        return;
                      }
                      bool inputCheck2 = gameResStr.split('-').length == 2;
                      if(!inputCheck2){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('エラー!!!')));
                        return;
                      }
                      bool inputCheck3 = int.parse(gameResStr.split('-')[0])>=11 || int.parse(gameResStr.split('-')[1])>=11;
                      if(!inputCheck3){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('エラー!!!')));
                        return;
                      }
                      // 入力チェック問題なし
                      setState((){
                        gameResStrList.add(gameResStr);
                        gameResStr = '';
                      });
                    }),
                  ]
                )
              ),
            ]
          ),
        ],
      )
    );
  }
  /// 編集Widget
  Widget editWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Container(alignment:Alignment.center,margin:const EdgeInsets.only(top:10,bottom:10), child:Text('【編集】No.'+widget.recId.toString(),style:const TextStyle(fontSize:20)),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            TextButton(
              child:const Text('保存',style:TextStyle(color:Colors.white)),
              style:TextButton.styleFrom(
                minimumSize:const Size(100,50),
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
                minimumSize:const Size(100,50),
                backgroundColor:Colors.redAccent,
              ),
              onPressed:(){
                Note.deleteData(widget.recId);
                Navigator.pop(context);
              },
            ),
          ]
        ),
      ]
    );
  }

  /// 新規登録Widget
  Widget newWidget(){
    return Column(
      children:[
        Container(alignment:Alignment.center,margin:const EdgeInsets.only(top:10,bottom:10), child:const Text('【新規登録】',style:TextStyle(fontSize:20)),),
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
      ]
    );
  }

  /// 得点シート
  Widget pointSheet(){
    return Row(mainAxisAlignment: MainAxisAlignment.center ,children:[
      Flexible(child:TextField(decoration:const InputDecoration(hintText:'名前'),controller: _inputDataController)),
      const Text('(',style:TextStyle(fontSize: 70,fontWeight: FontWeight.w100)),
      Container(alignment: Alignment.center,width:70,height:100,padding:const EdgeInsets.only(top:10,bottom:10),
        child:ListView.builder(
          itemCount: gameResStrList.length,
          itemBuilder: (BuildContext context,int index){
            return Text(gameResStrList[index],textAlign:TextAlign.center,style:const TextStyle(color:Colors.black));
          }
        )
      ),
      const Text(')',style:TextStyle(fontSize: 70,fontWeight: FontWeight.w100)),
      Flexible(child:TextField(decoration:const InputDecoration(hintText:'名前'),controller: _inputDataController2)),
    ]);
  }

  /// データ登録
  void insertData() async{
    Note note = Note(recId: 0,content: _inputDataController.text+gameResStrList.toString()+_inputDataController2.text);
    Note.insertData(note);
  }

  /// データ更新
  void updateData() async{
    Note note = Note(recId: 0,content: _inputDataController.text+gameResStrList.toString()+_inputDataController2.text);
    Note.update(widget.recId,note);
  }
}