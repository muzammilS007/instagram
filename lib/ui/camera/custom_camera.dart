import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() async{
    super.initState();
    widget.cameras = await availableCameras();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }

  @override
  BuildContext get context {

  }

  @override
  bool get mounted {

  }


  @override
  void reassemble() {

  }

  @override
  void setState(VoidCallback fn) {

  }

  @override
  void deactivate() {

  }

  @override
  void activate() {

  }

  @override
  void didChangeDependencies() {

  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {

  }
}