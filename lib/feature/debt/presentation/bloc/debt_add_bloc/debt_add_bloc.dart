import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:c_space/feature/debt/data/model/debt_get_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'debt_add_event.dart';

part 'debt_add_state.dart';

class DebtAddBloc extends Bloc<DebtAddEvent, DebtAddState> {
  String randNum = (Random().nextInt(900000) + 100000).toString();

  DebtAddBloc() : super(DebtAddState()) {
    on<AddDebtorEvent>(_addDebtor);
  }

  Future<void> _addDebtor(
      AddDebtorEvent event, Emitter<DebtAddState> emit) async {
    try {
      await FirebaseFirestore.instance.collection('Debt').doc(randNum).set(
            {
              'id' :  randNum,
              'name' : event.debtModel.name,
              'debtPrice' : event.debtModel.debtPrice,
              'debtTariff': event.debtModel.debtTariff,
              'debtMonth': event.debtModel.debtMonth
            }
          );
    } catch (error) {
      print('error $error');
    }
  }
}
