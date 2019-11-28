import 'package:cloud_firestore/cloud_firestore.dart';
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
  });

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

  factory LeadModel.fromSnapshot(DocumentSnapshot snap) {
    return LeadModel(
      uid: snap.documentID,
      companyName: snap['companyName'] ?? '',
      status: snap['status'] ?? '',
      jobTitle: snap['jobTitle'] ?? '',
      companyWebsite: snap['companyWebsite'] ?? '',
      listingUrl: snap['listingUrl'] ?? '',
      contactName: snap['contactName'] ?? '',
      contactEmail: snap['contactEmail'] ?? '',
      notes: snap['notes'] ?? '',
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

  @override
  String toString() {
    return 'LeadModel { uid: $uid, companyName: $companyName, status: $status, jobTitle: $jobTitle }';
  }

  @override
  List<Object> get props => [uid, companyName];
}
