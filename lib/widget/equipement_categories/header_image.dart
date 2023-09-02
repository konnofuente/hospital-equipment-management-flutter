import 'dart:io';

import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String? bannerUrl;

  HeaderImage(this.bannerUrl);

  @override
  Widget build(BuildContext context) {
    return (bannerUrl != null && bannerUrl!.isNotEmpty)
        ? Image.file(File(bannerUrl!))
        : Image.asset('assets/LogoCategories/Logo microbiologie et biologie moléculaire .JPG');
  }
}
