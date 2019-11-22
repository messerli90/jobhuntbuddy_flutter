import 'package:equatable/equatable.dart';

abstract class LeadEvent extends Equatable {
  const LeadEvent();
}

class GetLeadsEvent extends LeadEvent {
  @override
  List<Object> get props => null;
}

class GetLeadFromIdEvent extends LeadEvent {
  final String uid;

  GetLeadFromIdEvent(this.uid);

  @override
  List<Object> get props => [uid];
}