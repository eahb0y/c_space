import 'dart:developer';
import 'dart:io';

import 'package:c_space/feature/client/presintation/bloc/client_set_time_bloc/client_set_time_bloc.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ClientQr extends StatefulWidget {
  ClientQr({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClientQrState();
}

class _ClientQrState extends State<ClientQr> {
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
    String currentTime = DateFormat('HH:mm').format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Ink(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: result != null
                    ? Text(
                        'Имя: ${result!.code}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : const Text(
                        'Отсканируйте QR-код',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
              //${result!.code}
            ),
          ),
          Ink(
            height: 350,
            width: 350,
            child: _buildQrView(context),
          ),
        ],
      ),
      floatingActionButton: Ink(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            context.read<ClientSetTimeBloc>().add(
                  SetClientTime(
                    name: result!.code.toString(),
                    time: currentTime,
                  ),
                );
            Navigator.pushReplacementNamed(
              rootNavigatorKey.currentContext!,
              RoutName.client,
              arguments: result!.code.toString(),
            );
          },
          backgroundColor: Colors.purple.shade500,
          child: Icon(Icons.qr_code),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple.shade500,
        shape: CircularNotchedRectangle(),
        height: 70,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {},
                minWidth: 40,
                child: IconButton(
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {
                      isIconOne = !isIconOne;
                    });
                  },
                  icon: isIconOne == true
                      ? const Icon(
                          Icons.flashlight_on,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.flashlight_off,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 350.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderRadius: 10,
          borderColor: Colors.purple,
          borderLength: 40,
          borderWidth: 5,
          overlayColor: Colors.purple.shade50,
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
