import 'dart:io';
import 'dart:typed_data';
import 'package:evaltech_mobile/services/resourceService.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

import '../../Theme/app_theme.dart';

class PDFViewerScreen extends StatefulWidget {
  final String? pdfUrl;
  final String? pdfFilePath;

  PDFViewerScreen({this.pdfUrl, this.pdfFilePath});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  // late PDFViewController pdfViewController;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Uint8List? _pdfBytes;
  late File? pdfFile = (widget.pdfFilePath != null
      ? ResourcesServices().getPdfFileFromAssets(widget.pdfFilePath!)
      : null) as File?;

  @override
  void initState() {
    // widget.pdfFilePath != null
    //     ? pdfFile =
    //         await ResourcesServices().getPdfFileFromAssets(widget.pdfFilePath!)
    //     : pdfFile = null;
    super.initState();
    if (pdfFile != null) {
      loadPDFFromAsset();
    } else if (widget.pdfUrl != null) {
      loadPDFFromUrl();
    }
  }

  Future<void> loadPDFFromAsset() async {
    try {
      final bytes = await pdfFile!.readAsBytes();
      setState(() {
        _pdfBytes = bytes;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
      });
      print(error.toString());
    }
  }

  Future<void> loadPDFFromUrl() async {
    try {
      final response = await http.get(Uri.parse(widget.pdfUrl!));
      setState(() {
        _pdfBytes = response.bodyBytes;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
      });
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Viewer'),
        ),
        body: Center(
          child: Text(
            "PDF not yet available available",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.danger),
          ),
        )
        // Stack(
        //   children: [
        //     if (_pdfBytes != null)
        //       PDFView(
        //         pdfData: _pdfBytes!,
        //         onRender: (_pages) {
        //           setState(() {
        //             pdfViewController.setPage(currentPage!);
        //             isReady = true;
        //           });
        //         },
        //         onError: (error) {
        //           setState(() {
        //             errorMessage = "Le document n'est pas encore disponible";
        //           });
        //           print(error.toString());
        //         },
        //         onPageChanged: (int? page, int? total) {
        //           setState(() {
        //             currentPage = page;
        //           });
        //         },
        //         onViewCreated: (PDFViewController vc) {
        //           setState(() {
        //             pdfViewController = vc;
        //           });
        //         },
        //         onPageError: (page, error) {},
        //       )
        //     else if (errorMessage.isNotEmpty)
        //       Center(
        //         child: Text(
        //           // errorMessage,
        //           "Les document ne sont pas encore disponible",
        //           style: TextStyle(fontSize: 18, color: Colors.red),
        //         ),
        //       )
        //     else
        //       Center(
        //         child: CircularProgressIndicator(),
        //       ),
        //   ],
        // ),

        );
  }
}






























// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'dart:typed_data';
// import 'dart:async';
// import 'package:flutter/services.dart';

// class PDFViewerScreen extends StatefulWidget {
//   final String pdfUrl;

//   PDFViewerScreen({required this.pdfUrl});

//   @override
//   _PDFViewerScreenState createState() => _PDFViewerScreenState();
// }

// class _PDFViewerScreenState extends State<PDFViewerScreen> {
//   late PDFViewController pdfViewController;
//   int? currentPage = 0;
//   bool isReady = false;
//   String errorMessage = '';
//   Uint8List? _pdfBytes;

//   Future<ByteData> loadAsset() async {
//   return await rootBundle.load('assets/pdf/chemistry.pdf');
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: Stack(
//         children: [
//           PDFView(
//             // filePath: widget.pdfUrl,
//             onRender: (_pages) {
//               setState(() {
//                 pdfViewController.setPage(currentPage!);
//                 isReady = true;
//               });
//             },
//             onError: (error) {
//               setState(() {
//                 errorMessage = error.toString();
//               });
//               print(error.toString());
//             },
//             onPageChanged: (int? page, int? total) {
//               setState(() {
//                 currentPage = page;
//               });
//             },
//             onViewCreated: (PDFViewController vc) {
//               setState(() {
//                 pdfViewController = vc;
//               });
//             },
//             onPageError: (page, error) {},
//           ),
//           errorMessage.isNotEmpty
//               ? Center(
//                   child: Text(
//                     errorMessage,
//                     style: TextStyle(fontSize: 18, color: Colors.red),
//                   ),
//                 )
//               : !isReady
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Offstage(),
//         ],
//       ),
//     );
//   }
// }
