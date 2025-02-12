class Expense {
  final String id;
  final double amount;
  final String description;
  final String category;
  final DateTime date;

  Expense({
    required this.id,
    required this.amount,
    required this.description,
    required this.category,
    required this.date,
  });

  //create from json
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      amount: json['amount'],
      description: json['description'],
      category: json['category'],
      date: DateTime.parse(json['date']),
    );
  }

  //convert to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'category': category,
      'date': date.toIso8601String(),
    };
  }
}
