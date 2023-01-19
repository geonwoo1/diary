
import 'package:get/get.dart';

class dropCotroller extends GetxController {

  var selectedValue = '래빗페이지';
  var valueList = ['래빗페이지' ,'엘리스페이지','diary'];


  void change(value){
    selectedValue = value;
    update();
  }

}
