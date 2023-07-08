import 'dart:developer';
import 'dart:io';
import 'package:c_space/feature/client/presintation/client_bloc/client_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// ignore: must_be_immutable
class QRSan extends StatefulWidget {
  final String? locationName;

  QRSan({
    Key? key,
    required this.locationName,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRSanState();
}

class _QRSanState extends State<QRSan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isIconOne = true;
  bool getName = true;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text('Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {
                              isIconOne = !isIconOne;
                            });
                          },
                          icon: isIconOne == true
                              ? const Icon(Icons.flashlight_on)
                              : const Icon(Icons.flashlight_off),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: BlocBuilder<ClientBloc, ClientState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getName ? Colors.blue : Colors.red,
                          ),
                          onPressed: () {
                            context.read<ClientBloc>().add(
                                  GetAndSetClientTime(
                                      name: result!.code.toString(),
                                      locationName: widget.locationName ?? ''),
                                );
                          },
                          child: const Text('Check',
                              style: TextStyle(fontSize: 20)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
