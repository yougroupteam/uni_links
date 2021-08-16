import 'package:flutter/services.dart';

import '../uni_links_platform_interface.dart';

class MethodChannelUniLinks extends UniLinksPlatform {
  static const MethodChannel _mChannel = MethodChannel('uni_links/messages');
  static const EventChannel _eChannel = EventChannel('uni_links/events');

  @override
  Future<String> getInitialLink() =>
      _mChannel.invokeMethod<String>('getInitialLink');

  @override
  final Stream<String> linkStream = _eChannel
      .receiveBroadcastStream()
      .map<String>((dynamic link) => link as String);
}
