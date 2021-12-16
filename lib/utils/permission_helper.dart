import 'package:permission_handler/permission_handler.dart';

Future<void> checkPermission(Function response) async {
  final serviceStatus = await Permission.storage.status;
/*
  final isGpsOn = serviceStatus == ServiceStatus.enabled;
  if (!isGpsOn) {
    print('Turn on location services before requesting permission.');
    return;
  }
*/

  final status = await Permission.storage.request();
  if (status == PermissionStatus.granted) {
    print('Permission granted');
    response();
  } else if (status == PermissionStatus.denied) {
    print('Permission denied. Show a dialog and again ask for the permission');
  } else if (status == PermissionStatus.permanentlyDenied) {
    print('Take the user to the settings page.');
    await openAppSettings();
  }
}
