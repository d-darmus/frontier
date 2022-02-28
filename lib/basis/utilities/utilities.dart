class Utilities{
  static String backSpace(String str){
    if(str.isEmpty){
      return str;
    } else {
      int lastIndex = str.length - 1;
      return str.substring(0,lastIndex);
    }
  }
}