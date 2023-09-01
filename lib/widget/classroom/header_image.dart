import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String bannerUrl;

  HeaderImage(this.bannerUrl);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      bannerUrl,
      width: 600.0,
      height: 380.0,
      fit: BoxFit.cover,
    );
  }
}
