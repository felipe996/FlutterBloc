


import 'dart:async';

class HomePageBloc{
  var count = 0;

  var _controller = StreamController();
  get stream => _controller.stream;


  increment(int qtd) async{
    count += qtd;
    _controller.sink.add(count);
  }




  void close(){
    _controller.close();
  }





}