
import 'dart:async';
class eligibilityBloc{

  late bool cond;

  StreamController<bool> mainController=StreamController();
  StreamSink<bool> get mainSink=> mainController.sink;
  Stream<bool> get mainStream=> mainController.stream; 

  StreamController<int> eventController=StreamController();
  StreamSink<int> get eventSink=> eventController.sink;
  Stream<int> get eventStream=> eventController.stream; 

  eligibilityBloc(){
    eventStream.listen((event) {
      if (event>18) {
        cond=true;
        mainSink.add(cond);
      } else {
        cond=false;
        mainSink.add(cond);
      }
    });
  }

}

