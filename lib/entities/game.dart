class Game {
  final String title;
  final String description;
  final String image;
  final int price;
  final int quantity;

  Game(this.title, this.description, this.image, this.price, this.quantity);

  @override
  String toString() {
    return 'Game{title: $title, description: $description, image: $image, price: $price, quantity: $quantity}';
  }
}