import 'package:flutter/material.dart';

class ListLayout {

  static Widget sample(){
    return Column(
      children:[
        Flexible(
          child:ListView.builder(
            itemCount:5,
            itemBuilder:(BuildContext context,int index){
              return Text('sample:$index');
            }
          ),
        ),
      ],
    );
  }
}