import 'native_mobile_ui.g.dart';

final _api = NativeMobileHostApi();

Future<String> getNativeUiResult() async {
  try {
    return await _api.getNativeUiResult();
  } catch (e) {
    return 'Failed to retrieve result';
  }
}
