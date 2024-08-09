import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int totalSeconds = 0;
  bool isRunning = false;

  Future<void> runTime() async {
    while (isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        totalSeconds++;
      });
    }
  }

  void startWatch() {
    if (!isRunning) {
      setState(() {
        isRunning = true;
      });
      runTime();
    }
  }

  void stopWatch() {
    if (isRunning) {
      setState(() {
        isRunning = false;
      });
    }
  }

  void clearWatch() {
    stopWatch();
    setState(() {
      totalSeconds = 0;
    });
  }

  String formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Stopwatch"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(totalSeconds),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startWatch,
                  child: const Text("Start"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: stopWatch,
                  child: const Text("Stop"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: clearWatch,
                  child: const Text("Clear"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
