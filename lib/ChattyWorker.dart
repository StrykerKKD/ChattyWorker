// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The ChattyWorker library.
library ChattyWorker;

import 'dart:isolate';
import 'package:uuid/uuid.dart';

part 'boss.dart';
part 'worker.dart';
part 'standardmessage.dart';

Uuid uuid = new Uuid();
