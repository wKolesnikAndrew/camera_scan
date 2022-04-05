// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:flutter/services.dart';
// import 'package:camera_scan/camera_scan.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.
//     try {
//       platformVersion =
//           await CameraScan.platformVersion ?? 'Unknown platform version';
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Text('Running on: $_platformVersion\n'),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:camera_scan/camera_scan.dart';
import 'package:camera_scan/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'actions.dart';
import 'bottom_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // PDFDocument? _scannedDocument;
  // File? _scannedDocumentFile;
  // File? _scannedImage;
  PreferredSizeWidget? appBar;
  Widget? floatButton;
  Widget? bottomNavigation;
  Widget? bodyWidget;


  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Document Scanner Demo'),
  //       ),
  //       body: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           if (_scannedDocument != null || _scannedImage != null) ...[
  //             if (_scannedImage != null)
  //               Image.file(_scannedImage!,
  //                   width: 300, height: 300, fit: BoxFit.contain),
  //             if (_scannedDocument != null)
  //               Expanded(
  //                   child: PDFViewer(
  //                     document: _scannedDocument!,
  //                   )),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(
  //                   _scannedDocumentFile?.path ?? _scannedImage?.path ?? ''),
  //             ),
  //           ],
  //           Center(
  //             child: Builder(builder: (context) {
  //               return ElevatedButton(
  //                   onPressed: () => openPdfScanner(context),
  //                   child: Text("PDF Scan"));
  //             }),
  //           ),
  //           Center(
  //             child: Builder(builder: (context) {
  //               return ElevatedButton(
  //                   onPressed: () => openImageScanner(context),
  //                   child: Text("Image Scan"));
  //             }),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  void initState()
  {
    super.initState();
    // bodyWidget ??= actionsWidget();

    appBar ??= AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AutoSizeText("Bechtle document scanner",
          presetFontSizes: [18, 16, 14],
          maxLines: 1,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );

    floatButton ??= BottomNavigationOpenCameraFloatButton(
        onTap: (id) => {
          actionsWidgetState.updateScanFunction(ScanButton.values[id]),
          setState(() {})
        }, // AppNavigation.openPage(3, context),
        scanButton: ScanButton.FixPage,
      );

    bottomNavigation ??= BottomNavigationCircularNotchedAppBar(onTap: (id){});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: actionsWidget(),//bodyWidget,//scancam(context),
        floatingActionButton: floatButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavigation,
      ),
    );
  }

  // Widget bodyWidget()
  // {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       if (_scannedDocument != null || _scannedImage != null) ...[
  //         if (_scannedImage != null)
  //           Image.file(_scannedImage!,
  //               width: 300, height: 300, fit: BoxFit.contain),
  //         if (_scannedDocument != null)
  //           Expanded(
  //               child: PDFViewer(
  //                 document: _scannedDocument!,
  //               )),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //               _scannedDocumentFile?.path ?? _scannedImage?.path ?? ''),
  //         ),
  //       ],
  //       Center(
  //         child: Builder(builder: (context) {
  //           return ElevatedButton(
  //               onPressed: () => openPdfScanner(context),
  //               child: Text("PDF Scan"));
  //         }),
  //       ),
  //       Center(
  //         child: Builder(builder: (context) {
  //           return ElevatedButton(
  //               onPressed: () => openImageScanner(context),
  //               child: Text("Image Scan"));
  //         }),
  //       )
  //     ],
  //   );
  // }
}