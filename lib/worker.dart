part of ChattyWorker;

abstract class Worker {

  ReceivePort response;
  SendPort request;
  final name;
  bool canWork = false;

  Worker() : this.called(uuid.v4());

  Worker.called(this.name);

  void startWorking(SendPort request) {
    response = new ReceivePort();
    this.request = request;
    request.send(response.sendPort);
    response.listen((message) {
      if (canWork) work(message);
      if (message == Status.READY) {
        canWork = true;
        speak(Status.READY);
      }
    });
  }

  void work(message);

  void speak(message) {
    request.send(message);
  }

  void byebye() {
    response.close();
  }
}
