class Product {
  final int id, price;
  final String title, description;
  final String image;
  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
  });
  static Product fromMap(Map<String, Object?> map) {
    print('map is $map');
    final id = map['Id'] as int;
    print(id);
    final title = map['title'] as String;
    final description = map['description'] as String;
    final price = map['price'] as int;
    final image = map['image'] as String;

    return Product(
        title: title,
        id: id,
        image: image,
        price: price,
        description: description);
  }
}
// List<Product> product=[
//   Product(id:1,
//       price:456,
//       title:"Poppy Class tub Chair",
//       description:'Sabine Marcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake.',
//       image: Image.asset('assets/a1.jpg') ),
//   Product(id:2,
//     price:685,
//     title:"Class leather Arm Chair",
//     description:'wabine Marcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake.',
//     image: Image.asset('assets/a2.jpg'),),
//   Product(id:3,
//     price:856,
//     title:"Classy leather Arm Chair",
//     description:'mabine Marcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake.',
//     image: Image.asset('assets/a3.jpg'),),
//   Product(id:4,
//     price:796,
//     title:"wide leather Arm Chair",
//     description:'tabine Marcelis new Boa pouf looks like a doughnut. Or perhaps like its namesake snake.',
//     image: Image.asset('assets/a4.webp'),),
// ];
