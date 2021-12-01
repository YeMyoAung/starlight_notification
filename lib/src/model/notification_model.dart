part of starlight_notification;

class StarlightNotification {
  final String _title;
  final String _body;
  final String? _payload;

  int get _id => _title.hashCode;

  StarlightNotification({
    required String title,
    required String body,
    String? payload,
  })  : _title = title,
        _body = body,
        _payload = payload;
}
