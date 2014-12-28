part of ChattyWorker;

abstract class Worker {

  ReceivePort response;
  SendPort request;
  final name;

  Worker(): this.called(uuid.v4());

  Worker.called(this.name): response = new ReceivePort();

  void startWorking(SendPort request) {
    this.request = request;
    request.send(response.sendPort);
    response.listen((message) {
      work(message);
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
