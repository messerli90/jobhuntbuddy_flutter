import 'package:meta/meta.dart';

import '../../domain/entities/lead.dart';

class LeadModel extends Lead {
  final String uid;
  final String companyName;
  final String status;
  final String jobTitle;
  final String companyWebsite;
  final String listingUrl;
  final String contactName;
  final String contactEmail;
  final String notes;

  LeadModel({
    @required this.uid,
    @required this.companyName,
    this.status,
    this.jobTitle,
    this.companyWebsite,
    this.listingUrl,
    this.contactName,
    this.contactEmail,
    this.notes,
  }) : super(uid: uid, companyName: companyName);

  factory LeadModel.fromJson(Map<String, dynamic> json) {
    return LeadModel(
      uid: json['uid'],
      companyName: json['companyName'],
      status: json['status'],
      jobTitle: json['jobTitle'],
      companyWebsite: json['companyWebsite'],
      listingUrl: json['listingUrl'],
      contactName: json['contactName'],
      contactEmail: json['contactEmail'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'companyName': companyName,
      'status': status,
      'jobTitle': jobTitle,
      'companyWebsite': companyWebsite,
      'listingUrl': listingUrl,
      'contactName': contactName,
      'contactEmail': contactEmail,
      'notes': notes,
    };
  }
}
