part of ChattyWorker;

_startWorker(msg) {
  print(Boss.workers);
  Boss.workers[msg["worker"]].startWorking(msg["sendPort"]);
}

abstract class Boss {

  ReceivePort response;
  SendPort request;
  static Map<String,Worker> workers;
  Map<String,Isolate> isoWorkers;

  Boss() {
    response = new ReceivePort();
    workers = new Map<String,Worker>();
    isoWorkers = new Map<String, Isolate>();
    response.listen((message) {
      if(message is SendPort) {
        request = message;
      } else {
        manage(message);
      }
    });
  }

  void doYourJob(Worker worker) {
    workers[worker.name] = worker;
    Isolate.spawn(_startWorker, {"sendPort":response.sendPort,"worker":worker.name}).then((isoWorker) {
      isoWorkers[worker.name] = isoWorker;
    });
  }

  void manage(message);

  void speak(message) {
    request.send(message);
  }

  void byebye() {
    response.close();
  }

}
