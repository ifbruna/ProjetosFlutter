class Product {
  int? id;
  final String name;
  final int amount;
  final double price;
  bool buyed;

  Product({
    this.id,
    required this.name,
    required this.amount,
    required this.price,
    this.buyed = false,
  });

  void buy() {
    buyed = !buyed;
  }

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    amount: json['amount'],
    price: json['price'],
    buyed: json['buyed'] == 0 ? false : true,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'amount': amount,
    'price': price,
    'buyed': buyed ? 1 : 0,
  };
}
