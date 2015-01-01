part of example;

class WorkerBob extends Worker {

  @override
  void work(message) {
    print("From boss: $message");
    switch (message) {
      case "start":
        speak("started");
        break;
      case "stop":
        speak("stoped");
        byebye();
        break;
    }
  }
}
