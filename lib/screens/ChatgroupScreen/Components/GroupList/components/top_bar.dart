import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Center(
          // Row having the search container and the circle
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 12,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[300],
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey[300],
                              height: 1.2,
                              letterSpacing: 0.8,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width - 85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                ),

                // Circle on the top with camera icon
                Container(
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.primaryblue,
                  ),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ],
              // Container(height:)
            ),
          ),
        ),
      ),
      height: 110,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryblue,
            AppColors.lightprimaryblue,
          ],
        ),
      ),
    );
  }
}
