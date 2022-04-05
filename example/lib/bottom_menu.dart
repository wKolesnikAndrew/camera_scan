import 'package:camera_scan_example/sharp_edge_notch_shape.dart';
import 'package:flutter/material.dart';

enum ScanButton {
  NewPage,
  FixPage,
  SavePage,
  Unactive
}

class BottomNavigationOpenCameraFloatButton extends StatefulWidget {
  final Function(int)? onTap;
  final index = 3;
  ScanButton? scanButton = ScanButton.NewPage;

  BottomNavigationOpenCameraFloatButton({Key? key, required this.onTap, this.scanButton})
      : super(key: key);

  @override
  State<BottomNavigationOpenCameraFloatButton> createState() =>
      _BottomNavigationOpenCameraFloatButtonState();
}

class _BottomNavigationOpenCameraFloatButtonState
    extends State<BottomNavigationOpenCameraFloatButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: RawMaterialButton(
        onPressed: () {
          widget.onTap!(widget.index);
        },
        fillColor: Colors.red,
        shape: const CircleBorder(),
        elevation: 0.0,
        child: functionalButton(),
        // child: const Icon(
        //   Icons.add,
        //   color: Colors.white,
        //   size: 30,
        // ),
      ),
    );
  }

  Widget functionalButton()
  {
    switch(widget.scanButton){
      case ScanButton.NewPage:
        return const Icon(Icons.add, color: Colors.white, size: 30,);
      case ScanButton.FixPage:
        return const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 30,);
      case ScanButton.SavePage:
        return const Icon(Icons.check_circle_outline, color: Colors.white, size: 30,);
      case ScanButton.Unactive:
        return const Icon(null, color: Colors.white, size: 30,);
      default: return const Icon(Icons.add, color: Colors.white, size: 30,);
    }
  }
}



class BottomNavigationCircularNotchedAppBar extends StatefulWidget {
  final Function(int)? onTap;
  final double height = 60;
  BottomNavigationCircularNotchedAppBar({Key? key, required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationCircularNotchedAppBar> createState() =>
      _BottomNavigationCircularNotchedAppBarState();
}

class _BottomNavigationCircularNotchedAppBarState
    extends State<BottomNavigationCircularNotchedAppBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.red,
      notchMargin: 10,
      shape: const CircularSharpEdgeNotchedRectangle(),
      child: Container(
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  currentIndex = 0;
                  widget.onTap!(currentIndex);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    Text("Documents",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  currentIndex = 1;
                  widget.onTap!(currentIndex);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(height: 5),
                    Text("Settings",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SkipButton extends StatelessWidget {
  final Function() skip;
  const SkipButton({Key? key, required this.skip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => skip(),
      child: const Text(
        'Skip',
        style: TextStyle(color: Colors.white),
      ),
      //
      backgroundColor: Colors.red,
      splashColor: Colors.red,
    );
  }
}



class BottomNavigationFloatButtonSkelet extends StatelessWidget {
  const BottomNavigationFloatButtonSkelet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: RawMaterialButton(
        onPressed: () {},
        fillColor: Colors.red,
        shape: const CircleBorder(),
        elevation: 0.0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}



class BottomNavigationAppBarSkelet extends StatelessWidget {
  const BottomNavigationAppBarSkelet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.red,
      notchMargin: 10,
      shape: const CircularSharpEdgeNotchedRectangle(),
      child: Container(
        height: 60,
      ),
    );
  }
}

