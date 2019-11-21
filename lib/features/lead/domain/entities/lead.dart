import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Lead extends Equatable {
  final String uid;
  final String companyName;
  final String jobTitle;
  final String status;
  final String companyWebsite;
  final String listingUrl;
  final String contactName;
  final String contactEmail;
  final String notes;

  Lead({
    @required this.uid,
    @required this.companyName,
    this.jobTitle,
    this.status,
    this.companyWebsite,
    this.listingUrl,
    this.contactName,
    this.contactEmail,
    this.notes,
  });

  @override
  List<Object> get props => [uid, companyName];
}
