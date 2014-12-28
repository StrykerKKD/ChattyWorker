// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library example;

import 'package:ChattyWorker/ChattyWorker.dart';

part 'bigboss.dart';
part 'workerbob.dart';

main() {
  BigBoss bigBoss = new BigBoss();
  WorkerBob bob = new WorkerBob();

  bigBoss.doYourJob(bob);
}
