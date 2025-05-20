abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  @override
  String get message => "Server error occurred";
}
