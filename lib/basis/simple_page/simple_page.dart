import 'package:flutter/material.dart';
import 'package:frontier/basis/sample/sample_page1.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Title1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
