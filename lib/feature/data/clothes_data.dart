// class Category {
//   final String category;
//   final List<ClothesData> data;
//
//   Category({required this.category, required this.data});
//
//   Category copyWith({String? category, List<ClothesData>? data}){
//     return Category(category: category ?? this.category, data: data ?? this.data);
//   }
// }


class ClothesData {
  final int id;
  final String image;
  final String name;
  final String description;
  final int price;
  final String category;

  ClothesData(
      {required this.id,
      required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.category});
}

class Catalog {
  final String name;
  final List<String> images;

  Catalog({required this.name, required this.images});
}

List<Catalog> catalog = [
  Catalog( name: 'кофта', images: ['assets/image1.jpeg', 'assets/image2.jpeg','assets/image3.jpeg', 'assets/image4.jpeg']),
  Catalog(name: 'двойка', images: ['assets/image5.png', 'assets/image6.png', 'assets/image7.png']),
  Catalog(name: 'штаны', images: ['assets/image8.png', 'assets/image9.png', 'assets/image10.png']),
];