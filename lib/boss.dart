part of ChattyWorker;

_manager(message) {
  message[0].startWorking(message[1]);
}

abstract class Boss {

  ReceivePort response;
  SendPort request;

  Boss() {
    response = new ReceivePort();
    response.listen((message) {
      if (message is SendPort) {
        request = message;
        speak(Order.STARTWORKING);
      } else {
        manage(message);
      }
    });
  }

  void doYourJob(Worker worker) {
    Isolate.spawn(_manager, [worker, response.sendPort]);
  }

  void manage(message);

  void speak(message) {
    request.send(message);
  }

  void byebye() {
    response.close();
  }

}
