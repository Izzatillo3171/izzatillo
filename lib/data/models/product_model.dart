class ProductModel {
  final String productName;
  final String userId;
  final String shortDescription;
  final String authId;
  final String category;
  final String condition;
  final int itemNumber;
  final double price;
  final int star;
  final int count;
  final String imageUrl;

  ProductModel({
    required this.imageUrl,
    required this.count,
   required this.userId,
    required this.authId,
    required this.category,
    required this.condition,
    required this.itemNumber,
    required this.price,
    required this.productName,
    required this.shortDescription,
    required this.star
  });

  ProductModel copyWith({
    String? userId,
    String? imageUrl,
    String? authId,
    String? category,
    String? condition,
    double? price,
    String? shortDescription,
    String? productName,
    int? itemNumber,
    int? star,
    int? count
  }) {
    return ProductModel(
      imageUrl: imageUrl ?? this.imageUrl,
      count: count ?? this.count,
      userId: userId ?? this.userId,
      authId: authId ?? this.authId,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      price: price ?? this.price,
      shortDescription: shortDescription ?? this.shortDescription,
      itemNumber: itemNumber ?? this.itemNumber,
      productName: productName ?? this.productName,
      star: star ?? this.star,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      userId: json['userId'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      authId: json['authId'] as String? ?? "",
      category: json['category'] as String? ?? "",
      condition: json['condition'] as String? ?? "",
      shortDescription: json['shortDescription'] as String? ?? "",
      productName: json['productName'] as String? ?? "",
      star: json['star'] as int? ?? 0,
      itemNumber: json['itemNumber'] as int? ?? 0,
      count: json['count'] as int? ?? 0,
      price:(json['price'] as num? ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "imageUrl":imageUrl,
      'userId': userId,
      'authId': authId,
      'category': category,
      'condition': condition,
      'shortDescription': shortDescription,
      "productName": productName,
      "star": star,
      "itemNumber":itemNumber,
      "price":price,
      "count":count
    };
  }
  Map<String, dynamic> toJsonForUpdate() {
    return {
      "imageUrl":imageUrl,
      "count": count,
      "condition": condition,
      "star":star,
      "price":price,
      "itemNumber":itemNumber
    };
  }

// static CardModel initial() => CardModel(color: color, authId: authId, cardNumber: cardNumber, cardHolder: cardHolder, expireDate: expireDate, userId: userId, balance: balance, bank: bank, cvc: cvc, icon: icon, type: type, cardId: cardId);
}
