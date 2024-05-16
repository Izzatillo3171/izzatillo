class CategoryModel {
  final String categoryName;
  final String userId;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;

  CategoryModel({
    required this.userId,
    required this.categoryName,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3
  });

  CategoryModel copyWith({
    String? userId,
    String? categoryName,
    String? imageUrl1,
    String? imageUrl2,
    String? imageUrl3,
  }) {
    return CategoryModel(
      userId: userId ?? this.userId,
      categoryName: categoryName ?? this.categoryName,
      imageUrl1: imageUrl1 ?? this.imageUrl1,
      imageUrl2: imageUrl2 ?? this.imageUrl2,
      imageUrl3: imageUrl3 ?? this.imageUrl3,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      userId: json['userId'] as String? ?? "",
      categoryName: json['categoryName'] as String? ?? "",
      imageUrl1: json['imageUrl1'] as String? ?? "",
      imageUrl2: json['imageUrl2'] as String? ?? "",
      imageUrl3: json['imageUrl3'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'categoryName': categoryName,
      'imageUrl1': imageUrl1,
      'imageUrl2': imageUrl2,
      'imageUrl3': imageUrl3,
    };
  }
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'categoryName': categoryName,
      'imageUrl1': imageUrl1,
      'imageUrl2': imageUrl2,
      'imageUrl3': imageUrl3,
    };
  }

// static CardModel initial() => CardModel(color: color, authId: authId, cardNumber: cardNumber, cardHolder: cardHolder, expireDate: expireDate, userId: userId, balance: balance, bank: bank, cvc: cvc, icon: icon, type: type, cardId: cardId);
}
