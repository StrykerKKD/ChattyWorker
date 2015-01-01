part of example;

class BigBoss extends Boss{

  @override
  void manage(message) {
    speak("mama");
    print("From worker: $message");
    byebye();
  }

}