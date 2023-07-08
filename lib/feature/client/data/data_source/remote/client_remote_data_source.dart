import 'package:c_space/feature/client/data/model/client_get_time_model.dart';
import 'package:c_space/feature/client/domain/entity/client_request_entity.dart';

 abstract class ClientRemoteDataSource{
  Future<ClientModel> getClientTime(ClientRequestEntity clientRequestEntity);
}