class CountdownTimer {
  final int seconds;
  final Function(String) onTick;
  final Function onFinished;
  bool isRunning;

  CountdownTimer({
    required this.seconds,
    required this.onTick,
    required this.onFinished,
    this.isRunning = false
  });

  String remainTimeString(int sec) {
    int minutes = sec ~/ 60;
    int seconds = sec % 60;
    String min ;
    if(minutes < 100 ) {
      min = minutes.toString().padLeft(2, '0');
    }else {
      min = minutes.toString();
    }
    String se = seconds.toString().padLeft(2, '0');
    String formattedTime = "$min:$se";
    return formattedTime;
  }

  void start() async {
    isRunning = true;

    for (int i = seconds ; i >= 0 ; i--) {
      if(isRunning) {
        await Future.delayed(const Duration(seconds: 1), () {
          final str = remainTimeString(i);
          onTick(str);
          if (i == 0) {
            onFinished();
          }
        });
      }else {
        onFinished();
      }
    }
  }

  void cancel() {
    isRunning = false;
  }
}