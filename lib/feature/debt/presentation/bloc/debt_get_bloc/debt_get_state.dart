part of 'debt_get_bloc.dart';


 class DebtGetState extends Equatable{
  final List<DebtGetModel> debtModal;
  DebtGetState({required this.debtModal});


  DebtGetState copyWith({
   List<DebtGetModel>? debtModal,
 }){
   return DebtGetState(
    debtModal: debtModal ?? this.debtModal
   );
  }
  @override
  List<Object?> get props => [debtModal];
 }

