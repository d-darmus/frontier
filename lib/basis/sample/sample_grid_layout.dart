import 'package:flutter/material.dart';

class GridLayout {

  static Widget sample(){
    return Column(
      children:[
        headerBarRow(),
        Row(
          children:[
            dataBox(),
            Container(alignment: Alignment.center,width:50,height:50,child:const Text('button'),color:Colors.blueAccent),
          ],
        ),
      ],
    );
  }

  static Widget headerBarRow(){
    return Row(
      children:[
        Container(alignment: Alignment.center,width:50,height:50,child:const Text('hoge'),color:Colors.grey),
        Container(alignment: Alignment.center,width:50,height:50,child:const Text('fuga'),color:Colors.lime),
      ],
    );
  }

  static Widget dataBox(){
    return Column(
      children:[
        Row(
          children: [
            Container(alignment: Alignment.center,width:50,height:50,child:const Text('data1'),color:Colors.red),
            Container(alignment: Alignment.center,width:50,height:50,child:const Text('data2'),color:Colors.blue),
            Container(alignment: Alignment.center,width:50,height:50,child:const Text('data3'),color:Colors.green),
          ],
        ),
        Row(
          children: [
            Container(alignment: Alignment.center,width:50,height:50,child:const Text('data1'),color:Colors.blue),
            Container(alignment: Alignment.center,width:50,height:50,child:const Text('data2'),color:Colors.green),
            Container(alignment: Alignment.center,width:50,height:50,child:const Text('data3'),color:Colors.red),
          ],
        ),
      ],
    );
  }
}