class DebtGetModel {
  final String name;
  final String debtPrice;
  final List<dynamic>? debtMonth;
  final List<dynamic>? debtTariff;
  final String? id;

  DebtGetModel({
    required this.id,
    required this.debtTariff,
    required this.debtMonth,
    required this.name,
    required this.debtPrice,
  });


  factory DebtGetModel.fromFirebase(Map<String, dynamic> json) {
    return DebtGetModel(
      id: json['id'],
      name: json['name'],
      debtPrice: json['debtPrice'],
      debtTariff: json['debtTariff'],
      debtMonth: json['debtMonth'],
    );
  }
}
