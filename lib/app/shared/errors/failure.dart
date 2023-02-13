abstract class FailureCustom implements Exception {
  String? get message;
}

class ConnectionError extends FailureCustom {
  @override
  final String? message;
  ConnectionError({this.message});
}

class InternetConnectionError extends FailureCustom {
  @override
  final String? message;
  InternetConnectionError({this.message});
}

class UnexpectedError extends FailureCustom {
  @override
  final String? message;
  UnexpectedError({this.message});
}

class InternalError implements FailureCustom {
  @override
  final String? message;
  InternalError({this.message});
}
