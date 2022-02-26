import 'package:flutter/material.dart';

class SampleTab1 extends StatefulWidget {
  const SampleTab1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _SampleTab1();
  }
}

class _SampleTab1 extends State<SampleTab1> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children:const [
          Text('Sample1'),
          Text('Sample2'),
        ],
      ),
    );
  }
}