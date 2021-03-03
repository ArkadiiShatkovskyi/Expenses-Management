class Expense{
  final double price;
  final String category;
  final String place;
  final DateTime date;
 
  Expense({this.category, this.place, this.price, this.date});

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'place': place,
      'price': price,
      'date' : date.toString()
    };
  }
}