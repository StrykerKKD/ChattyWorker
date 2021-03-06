part of ChattyWorker;

void _workerStarter(message) {
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
        speak(Status.READY);
      } else {
        manage(message);
      }
    });
  }

  void hire(Worker worker) {
    Isolate.spawn(_workerStarter, [worker, response.sendPort]);
  }

  void manage(message);

  void speak(message) {
    request.send(message);
  }

  void byebye() {
    response.close();
  }

}
