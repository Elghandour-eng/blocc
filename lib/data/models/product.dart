class Product {
  final String? name;
  final String? price;
  final String? fat;
  final String? category;
  final String? cal;
  final String? id;

  Product({
    this.name,
    this.price,
    this.fat,
    this.category,
    this.cal,
    this.id,
  });

  Map<String, dynamic> toMap() => {
        'Name': name,
        'id': id,
        'Fat': fat,
        'Cal': cal,
        'Category': category,
        'Price': price,
      };

  factory Product.fromMap(
    Map<String, dynamic> map,
  ) =>
      Product(
        name: map['Name'],
        id: map['id'],
        fat: map['Fat'],
        cal: map['Cal'],
        category: map['Category'],
        price: map['Price'],
      );

  Product copyWith({
    String? name,
    String? price,
    String? fat,
    String? category,
    String? cal,
    String? id,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      fat: fat ?? this.fat,
      category: category ?? this.category,
      cal: cal ?? this.cal,
      id: id ?? this.id,
    );
  }
}
