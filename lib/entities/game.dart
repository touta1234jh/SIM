class Game {
  final String? id;
  final String title;
  final String description;
  final String image;
  final int price;
  final int quantity;

  Game({
  this.id,
  required this.title,
  required this.description,
  required this.image,
  required this.price,
  required this.quantity,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  @override
  String toString() {
  return 'Game{id: $id, title: $title}';
  }

}