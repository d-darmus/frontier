import 'package:flutter/material.dart';
import 'package:frontier/test/test_const.dart';

class TestPage2Builder extends StatefulWidget {
  const TestPage2Builder({Key? key}) : super(key: key);
  @override
  State<TestPage2Builder> createState() => _TestPage2BuilderState();
}
class _TestPage2BuilderState extends State<TestPage2Builder> {
  //-----template-----
  @override
  void initState(){
    searchProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child:sampleWidget(context),
      ),
    );
  }
  //-----template-----

  String _productName = "title";
  String _contents = "contents_contents_contens_contents";
  String _imgfileName = "1.jpg";
  final TextEditingController _searchStringController = TextEditingController();

  Widget sampleWidget(BuildContext _context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Row(
          children:[
            Flexible(
              child:TextField(decoration: const InputDecoration(hintText:'商品名を入力...'), controller:_searchStringController,),
            ),
            TextButton(
              child:const Text('検索'),
              onPressed: (){searchProduct();},
            ),
          ]
        ),
        Container(alignment: Alignment.center,padding: const EdgeInsets.only(top:10,bottom:10),child:Text(_productName,style:const TextStyle(fontSize:18))),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(alignment: Alignment.center,width:200,height:250,color:Colors.white,child:Image.asset('images/'+_imgfileName),),
            Expanded(
              child:Container(
                alignment: Alignment.topLeft,height:250,padding:const EdgeInsets.only(top:10,left:10,right:10),color:Colors.red,
                child:Text(_contents,style:const TextStyle(color:Colors.white,fontSize:18)),
              ),
            ),
          ],
        ),
      ]
    );
  }

  void searchProduct(){
    String _product = "";
    if(_searchStringController.text.toString().isEmpty){
      _product = "コーラ味";
    } else {
      _product = _searchStringController.text;
    }
    for(int i = 0; i<TestConst.list.length; i++){
      print(TestConst.list[i].getProductName());
      if(TestConst.list[i].getProductName().contains(_product)){
        setState((){
          _productName = TestConst.list[i].getProductName();
          _contents = TestConst.list[i].getContent();
          _imgfileName = TestConst.list[i].getImgfileName();
        });
      }
    }
  }
}