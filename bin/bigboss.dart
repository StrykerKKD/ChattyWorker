part of example;

class BigBoss extends Boss {

  bool started = false;

  @override
  void manage(message) {
    print("From worker: $message");
    if (!started) {
      started = true;
      speak("start");      
    }
    switch (message) {
      case "started":        
        speak("stop");
        break;
      case "stoped":
        byebye();
        break;
    }
  }

}
