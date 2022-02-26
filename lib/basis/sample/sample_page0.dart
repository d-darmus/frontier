import 'package:flutter/material.dart';
import 'package:frontier/basis/sample/sample_page1.dart';

class SamplePage0 extends StatelessWidget{
  const SamplePage0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('Title1'),
      ),
      body: Center(
        child: Column(
          children:[
            Container(alignment:Alignment.center,margin:const EdgeInsets.only(top:10,bottom:10), child:const Text('Home'),),
            TextButton(child:const Text('画面遷移',style:TextStyle(color:Colors.white)),
              style:TextButton.styleFrom(
                minimumSize:const Size(250,50),
                backgroundColor: Colors.pink,
              ),
              onPressed:(){
              Navigator.push(context,MaterialPageRoute(
                builder:(context) =>  const SamplePage1()
              ));
            }),
          ],
        ),
      ),
    );
  }
}