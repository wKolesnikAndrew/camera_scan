import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:camera_scan/camera_scan.dart';
import 'package:camera_scan/configs/configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_menu.dart';

enum ExitAction {
  NoAction,
  ExitDocList,
  ExitSettings,
}

class actionsWidget extends StatefulWidget
{
  ScanButton? updateScanAction;

  actionsWidget({Key? key, this.updateScanAction = ScanButton.FixPage}): super(key: key);

  @override
  State<actionsWidget> createState() => actionsWidgetState();
}

class actionsWidgetState extends State<actionsWidget>
    with SingleTickerProviderStateMixin {

  Widget? actionWidget;
  ExitAction? exit;
  static ScanButton? updateScanAction;

  PDFDocument? _scannedDocument;
  File? _scannedDocumentFile;
  File? _scannedImage;

  @override
  void initState() {
    super.initState();
  }

  static updateScanFunction(ScanButton func)
  {
      updateScanAction = func;
  }

  updateScanButton(ScanButton action)
  {
    setState(() {
      updateScanAction = action;
    });
  }

  updateScan(ExitAction close, ScanButton scan)
  {
    setState(() {
      exit = close;
      updateScanAction = scan;
    });
  }

  Future<void> openPdfScanner(BuildContext context) async {
    await Future.delayed(Duration.zero);
    var doc = await CameraScan.launchForPdf(
      context,
      labelsConfig: {
        ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next Steps",
        ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_SINGLE: "Only 1 Page",
        ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_MULTIPLE:
        "Only {PAGES_COUNT} Page"
      },
      source: ScannerFileSource.CAMERA
    );
    if (doc != null) {
      _scannedDocument = null;
      setState(() {});
      await Future.delayed(Duration(milliseconds: 100));
      _scannedDocumentFile = doc;
      _scannedDocument = await PDFDocument.fromFile(doc);
      setState(() {});
    }

    return;
  }

  openImageScanner(BuildContext context) async {
    var image = await CameraScan.launch(context,
        //source: ScannerFileSource.CAMERA,
        labelsConfig: {
          ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next Step",
          ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"
        });
    if (image != null) {
      _scannedImage = image;
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: openPdfScanner(context),
      builder: (context, snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting){
          return Center(child: Text('Please wait its loading...'));
        }
        else{
          if (snapshot.hasError)
            return Center(child: Text('Error:'));
          else
            return Center(child: new Text('data'));  // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      }
    );



    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
      // children: [
        /*if (_scannedDocument != null || _scannedImage != null) ...[
          if (_scannedImage != null)
            Image.file(_scannedImage!, width: 300, height: 300, fit: BoxFit.contain),

          if (_scannedDocument != null)
            Expanded(child: PDFViewer(document: _scannedDocument!,)),
          Padding(padding: const EdgeInsets.all(8.0),
            child: Text(_scannedDocumentFile?.path ?? _scannedImage?.path ?? ''),
          ),
        ],*/
        // Center(
        //   child: Builder(builder: (context) {
        //     return ElevatedButton(
        //         onPressed: () => openPdfScanner(context),
        //         child: Text("PDF Scan"));
        //   }),
        // ),
        // Center(
        //   child: Builder(builder: (context) {
        //     return ElevatedButton(
        //         onPressed: () => openImageScanner(context),
        //         child: Text("Image Scan"));
        //   }),
        // )
      // ],
    // );
      // child: Column(
      //   children: [
      //     ListTile(
      //       title: Text(
      //         myTitle,
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     ElevatedButton(
      //       //Update Child 1 from Parent
      //       child: Text("Action 1"),
      //       onPressed: () {
      //         setState(() {
      //           updateChild1Title = "Update from Parent";
      //         });
      //       },
      //     ),
      //     TabBar(
      //       controller: _controller,
      //       tabs: [
      //         Tab(
      //           text: "First",
      //           icon: Icon(Icons.check_circle),
      //         ),
      //         Tab(
      //           text: "Second",
      //           icon: Icon(Icons.crop_square),
      //         )
      //       ],
      //     ),
      //     Expanded(
      //       child: TabBarView(
      //         controller: _controller,
      //         children: [
      //           Child1Page(
      //             title: updateChild1Title,
      //             child2Action2: updateParent,
      //             child2Action3: updateChild2,
      //           ),
      //           Child2Page(),
      //         ],
      //       ),
      //     )
      //   ],
      // ),

  }
}
