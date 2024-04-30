import 'dart:async';


class TimerBloc {

  Duration time = Duration.zero; 
  late Timer timer;

  StreamController<int> streamController=StreamController();
  StreamSink<int> get mainSink => streamController.sink;
  Stream<int> get mainStream => streamController.stream;

  StreamController<int> eventController=StreamController();
  StreamSink<int> get eventSink => eventController.sink;
  Stream<int> get eventStream => eventController.stream;

  TimerBloc(){
    eventStream.listen((event) {
      mainSink.add(event);
    });
  }

  void start(){
    timer=Timer.periodic(Duration(microseconds:250), (timer) { 
      time += Duration(milliseconds:3);
    eventSink.add(time.inMilliseconds);
    
  });
  }

  void stop(){
    timer.cancel();
  }

  void reset(){
    timer.cancel();
    time=Duration.zero;
    eventSink.add(0);
  }

}

