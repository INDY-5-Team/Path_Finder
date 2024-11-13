import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  QrCodeScanner({
    required this.setresult,
    super.key,
  });

  final Function setresult;
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      onDetect: (BarcodeCapture capture) async {
        final List<Barcode> barcodes = capture.barcodes;
        final barcode = barcodes.first;

        if (barcode.rawValue != null) {
          setresult(barcode.rawValue);
          await controller
              .stop()
              .then((value) => controller.dispose())
              .then((value) => Navigator.of(context).pop());
        }
      },
    );
  }
}
