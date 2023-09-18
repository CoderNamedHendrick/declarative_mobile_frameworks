import 'package:flutter/services.dart';

const nativeChannelName = 'com.hendrick.navigateChannel';
const methodChannel = MethodChannel(nativeChannelName);

const navigateFunctionName = 'flutterNavigate';

Future<String> navigateToNative() async {
  try {
    var data = await methodChannel.invokeMethod(navigateFunctionName);
    return data;
  } on PlatformException catch (e) {
    return 'Failed to invoke: ${e.message}';
  }
}
