part of example;

class WorkerBob extends Worker{

  @override
  void work(message) {
    speak("papa");
    print("From Boss: $message");
    byebye();
  }

}