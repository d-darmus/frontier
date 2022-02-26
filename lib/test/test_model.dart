class TestModel{
  String productName = "";
  String content = "";
  String imgfileName = "";
  TestModel(String _productName,String _content,String _imgfileName){
    productName = _productName;
    content = _content;
    imgfileName = _imgfileName;
  }
  String getProductName(){
    return productName;
  }
  String getContent(){
    return content;
  }
  String getImgfileName(){
    return imgfileName;
  }
}