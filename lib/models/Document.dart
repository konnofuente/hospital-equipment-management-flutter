// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Document {
  final String title;
  final String subtitle;
  final String url;
  final Icon icon;
  final bool isLocked;
   String? description;
   DateTime? dateUploaded;
   int? fileSize;
   String? fileType;

  Document({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.icon,
    required this.isLocked,
    this.description,
    this.dateUploaded,
    this.fileSize,
    this.fileType,
  });
}
