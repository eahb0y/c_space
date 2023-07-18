import 'dart:developer';
import 'dart:io';

import 'package:c_space/feature/client/presintation/bloc/client_set_time_bloc/client_set_time_bloc.dart';
import 'package:c_space/feature/employee/presentation/bloc/employee_set_time_bloc/employee_set_time_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EmployeeQr extends StatefulWidget {

  EmployeeQr({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmployeeQrState();
}

class _EmployeeQrState extends State<EmployeeQr> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isIconOne = true;

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
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
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
                    Text('Имя: ${result!.code}')
                  else
                    const Text('Отсканируйте qr-код'),
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
                    child: BlocBuilder<EmployeeSetTimeBloc, EmployeeSetTimeState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          onPressed: () {
                            context.read<EmployeeSetTimeBloc>().add(
                              EmployeeSetTime(
                                name: result!.code.toString(),
                              ),
                            );
                            Navigator.pop(
                                context,
                                result!.code.toString()
                            );
                          },
                          child: const Text('Регистрироваться',
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
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, true),
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
