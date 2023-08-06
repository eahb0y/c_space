import 'package:c_space/feature/time_tracker/data/model/client_get_time_model.dart';

class ClientInfoArgument {
  final String clientName;
  final List<ClientModel>? clientModel;

  ClientInfoArgument({
    required this.clientModel,
    required this.clientName
  });
}