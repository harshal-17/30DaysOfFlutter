class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: 'iPhone 12 Pro',
        description: 'Apple iPhone 12th Generation',
        price: 999,
        color: '#33505a',
        image:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-graphite-hero?wid=940&hei=1112&fmt=png-alpha&.v=1604021660000')
  ];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}
