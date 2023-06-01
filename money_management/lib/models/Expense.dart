class Expense {
  final double price;
  final String category;
  final String place;
  final DateTime date;

  Expense({required this.category, required this.place, required this.price, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'place': place,
      'price': price,
      'date': date.toString()
    };
  }

  String getDate() {
    int day = date.day;
    int month = date.month;
    String dayS = day.toString();
    String monthS = month.toString();
    if (day < 10) dayS = "0" + day.toString();
    if (month < 10) monthS = "0" + month.toString();
    return dayS + ":" + monthS;
  }

  String toString() {
    return category +
        ", " +
        price.toString() +
        ", " +
        place +
        ", " +
        date.toString();
  }
}
