import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Lead extends Equatable {
  final int id;
  final String companyName;
  final String jobTitle;
  final String status;
  final String companyWebsite;
  final String listingWebsite;
  final String contactName;
  final String contactEmail;
  final String notes;

  Lead({
    @required this.id,
    @required this.companyName,
    this.jobTitle,
    this.status,
    this.companyWebsite,
    this.listingWebsite,
    this.contactName,
    this.contactEmail,
    this.notes,
  }) : super([
          id,
          companyName
        ]);
}
