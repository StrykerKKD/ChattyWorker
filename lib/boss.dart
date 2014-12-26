part of ChattyWorker;

abstract class Boss {

  ReceivePort response;
  SendPort request;
  Map<String,Isolate> workers;

  Boss() {
    response.listen((String message) {
      manage(message);
    });
  }

  void doYourJob(Worker worker) {
    Isolate.spawn(worker.startWorking, response.sendPort).then((isoWorker) {
      workers[worker.name] = isoWorker;
    });
  }

  void manage(String message);

  void speak(String message) {
    request.send(message);
  }

  void byebye() {
    response.close();
  }

}
