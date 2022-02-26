import 'package:flutter/material.dart';

class SamplePage1 extends StatelessWidget{
  const SamplePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('Title2'),
      ),
      body:Column(
        children:[
          Container(alignment:Alignment.center,margin:const EdgeInsets.only(top:10,bottom:10), child:const Text('samplePage'),),
          TextButton(
            child:const Text('戻る',style:TextStyle(color:Colors.white)),
            style:TextButton.styleFrom(
              minimumSize:const Size(250,50),
              backgroundColor:Colors.blue,
            ),
            onPressed:(){
              Navigator.pop(context);
            },
          ),
        ]
      ),
    );
  }
}