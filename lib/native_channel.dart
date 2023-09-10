import 'package:flutter/services.dart';

const nativeChannelName = 'com.hendrick.navigateChannel';
var methodChannel = const MethodChannel(nativeChannelName);

Future<String> callNativeCode() async {
  try {
    var data = await methodChannel.invokeMethod('navigateFunction');
    return data;
  } on PlatformException catch (e) {
    return 'Failed to Invoke: ${e.message}';
  }
}
