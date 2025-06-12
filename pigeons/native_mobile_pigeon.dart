import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/native_api/native_mobile_ui.g.dart',
    kotlinOut: 'android/app/src/main/kotlin/com/example/mobile_declarative_ui/NativeMobileUi.g.kt',
    javaOut: 'android/app/src/main/java/io/flutter/plugins/NativeMobileUi.java',
    swiftOut: 'ios/Runner/NativeMobileUi.g.swift',
    dartPackageName: 'native_mobile_ui',
  ),
)
@HostApi()
abstract class NativeMobileHostApi {
  @async
  String getNativeUiResult();
}
