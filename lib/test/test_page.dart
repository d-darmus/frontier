import 'package:flutter/material.dart';
import 'package:frontier/test/test_const.dart';

class TestPageBuilder extends StatefulWidget {
  const TestPageBuilder({Key? key}) : super(key: key);
  @override
  State<TestPageBuilder> createState() => _TestPageBuilderState();
}
class _TestPageBuilderState extends State<TestPageBuilder> with SingleTickerProviderStateMixin {
  //-----
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:sample(context),
      ),
    );
  }
  //-----

  final List<String> _displayList = [];

  Widget sample(BuildContext _context){
    return Column(
      children:[
        TextButton(
          child:const Text('ダイアログ'),
          onPressed:(){
            alert(_context);
          },
        ),
        Flexible(
          child:ListView.builder(
            itemCount:TestConst.list.length,
            itemBuilder:(BuildContext context,int index){
              String _str = TestConst.list[index].getProductName();
              return Text('No.$index ,商品名：$_str');
            }
          ),
        ),
      ]
    );
  }

  void alert(BuildContext _context) async{
    const int ok = 1;
    const int cancel = 0;
    int _result = await showDialog(
      context: _context,
      barrierDismissible: false,
      builder:(BuildContext context){
        return AlertDialog(
          title:const Text('タイトル'),
          content:const Text('内容'),
          actions:[
            TextButton(child:const Text('OK'),onPressed:(){
              Navigator.of(context).pop(ok);
            }),
            TextButton(child:const Text('Cancel'),onPressed:(){
              Navigator.of(context).pop(cancel);
            }),
          ],
        );
      }
    );
    switch(_result){
      case ok:
        setState(() {_displayList.add("add");});
        break;
      case cancel:
        setState(() {_displayList.add("cancel");});
        break;
    }
  }
}