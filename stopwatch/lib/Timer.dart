import 'package:flutter/material.dart';
import 'package:stopwatch/TimerBloc.dart';

void main() {
  runApp(Timer());
} 

class Timer extends StatelessWidget {
  Timer({super.key});
  TimerBloc timbloc=TimerBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: 900,
          width: double.infinity,
          decoration: BoxDecoration(color: Color.fromARGB(189, 22, 21, 21)),
          child: Column(
            children: [
              SizedBox(height: 300,),
              StreamBuilder(
                stream: timbloc.mainStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                      return Text(
                        "${(snapshot.data! ~/ 3600000)}:${(snapshot.data! ~/ 60000)%60}:${(snapshot.data! ~/ 1000)%60}:${snapshot.data!%100}",
                        style: TextStyle(fontSize: 50),
                      );
                    } else {
                      return Text("${0 ~/ 3600000}:${(0 ~/ 1000) % 60}:${0 ~/ 1000}:${0}",style: TextStyle(fontSize: 50));
                    } }
              ),
              ElevatedButton(onPressed: () {
                timbloc.start();
              }, child: Text('START')),
              ElevatedButton(onPressed: () {
                timbloc.stop();
              }, child: Text('STOP')),
              ElevatedButton(onPressed: () {
                timbloc.reset();
              }, child: Text('RESET')),
            ],
          ),
        ),
      ),
    );
  }
}