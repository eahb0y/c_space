import 'package:bloc/bloc.dart';
import 'package:c_space/feature/debt/data/model/debt_get_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'debt_get_event.dart';

part 'debt_get_state.dart';

class DebtGetBloc extends Bloc<DebtGetEvent, DebtGetState> {
  DebtGetBloc() : super(DebtGetState(debtModal: [])) {
    on<DebtInfoGetEvent>(_debtInfo);
  }

  Future<void> _debtInfo(DebtInfoGetEvent event, Emitter<DebtGetState> emit) async{
    try {
      List<DebtGetModel> debtModal = [];
      final request =
      await FirebaseFirestore.instance.collection('Debt').get();
      request.docs.forEach((element) {
        print('This is data of debtors');
        print(request.size);
        return debtModal.add(DebtGetModel.fromFirebase(element.data()));
      });
      print('This is data of debtors');
      print(debtModal);
      emit(state.copyWith(debtModal: debtModal));
    } catch (error) {
      print("cause of $error");
      emit(state.copyWith(debtModal: []));
    }
  }
}
