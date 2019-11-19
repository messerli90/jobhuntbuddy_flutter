import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// General Failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}