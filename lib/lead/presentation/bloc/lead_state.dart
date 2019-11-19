import 'package:equatable/equatable.dart';

abstract class LeadState extends Equatable {
  const LeadState();
}

class InitialLeadState extends LeadState {
  @override
  List<Object> get props => [];
}
