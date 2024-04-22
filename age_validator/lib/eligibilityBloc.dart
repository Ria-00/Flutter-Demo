
import 'dart:async';

class eligibilityBloc{

  StreamController<String> mainController=StreamController();
  StreamSink<String> get mainSink=> mainController.sink;
  Stream<String> get mainStream=> mainController.stream; 

  StreamController<int> eventController=StreamController();
  StreamSink<int> get eventSink=> eventController.sink;
  Stream<int> get eventStream=> eventController.stream; 

  eligibilityBloc(){
    eventStream.listen((event) {
      if (event>18) {
        mainSink.add("yes");
      } else {
        mainSink.add("no");
      }
    });
  }

}

