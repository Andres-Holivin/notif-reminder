import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class TimezoneService {
  String _timeZoneName = '';
  Future<void> configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tz.initializeTimeZones();
    _timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(_timeZoneName));
  }

  String getLocalTimezone() {
    print("Timezone: $_timeZoneName");
    return _timeZoneName;
  }
}
