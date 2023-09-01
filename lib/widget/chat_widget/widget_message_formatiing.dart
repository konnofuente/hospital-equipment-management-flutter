
//   import 'package:flutter/material.dart';

// Widget messageFormatting(message, sentBy) {
//     print(message.length);
//     return sentBy == "me"
//         ? Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     showTime == false ? showTime = true : showTime = false;
//                   });
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(10),
//                   width: MediaQuery.of(context).size.width,
//                   alignment: Alignment.centerRight,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: AppColors.lightprimaryblue,
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(18),
//                               topLeft: Radius.circular(18),
//                               topRight: Radius.circular(18)),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(
//                             15,
//                           ),
//                           child: Container(
//                             width: message.length > 100 ? 160 : null,
//                             child: Text(message,
//                                 overflow: TextOverflow.clip,
//                                 softWrap: true,
//                                 style: TextStyle(color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               showTime
//                   ? Padding(
//                       padding: const EdgeInsets.only(right: 15.0),
//                       child: Text(
//                         "01:15 PM",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 10,
//                         ),
//                       ),
//                     )
//                   : Container(),
//             ],
//           )
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     showTime == false ? showTime = true : showTime = false;
//                   });
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(10),
//                   width: MediaQuery.of(context).size.width,
//                   alignment: Alignment.centerLeft,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(right: 8),
//                         child: Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                               color: Colors.grey, shape: BoxShape.circle),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(18),
//                               bottomLeft: Radius.circular(18),
//                               topRight: Radius.circular(18)),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(
//                             15,
//                           ),
//                           child: Container(
//                             width: message.length > 80 ? 160 : null,
//                             child: Text(message,
//                                 overflow: TextOverflow.clip,
//                                 softWrap: true,
//                                 style: TextStyle(color: Colors.grey[700])),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               showTime
//                   ? Padding(
//                       padding: const EdgeInsets.only(left: 65.0),
//                       child: Text(
//                         "01:15 PM",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 10,
//                         ),
//                       ),
//                     )
//                   : Container(),
//             ],
//           );
//   }
