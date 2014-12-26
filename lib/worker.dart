part of ChattyWorker;

abstract class Worker {

  ReceivePort response = new ReceivePort();
  SendPort request;
  final name;

  Worker(): name = uuid.v4();

  Worker.called(this.name);

  void startWorking(SendPort request) {
    this.request = request;
    request.send(response.sendPort);
    response.listen((String message) {
      work(message);
    });
  }

  void work(String message);

  void speak(String message) {
    request.send(message);
  }

  void byebye() {
    response.close();
  }
}
