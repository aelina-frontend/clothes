class Clothes {
  final String title;
  final String image;
  final List<String> images;
  final String description;

  Clothes(
      {required this.title,
      required this.image,
      required this.description,
      required this.images});

  factory Clothes.fromJson(Map<String, dynamic> json) {
    return Clothes(
      title: json['title'],
      image: json['image'],
      description: json['description'],
      images: List<String>.from(json['images']),
    );
  }
}

class Catalog {
  final String name;
  final List<String> images;

  Catalog({required this.name, required this.images});
}

List<Catalog> catalog = [
  Catalog(name: 'кофта', images: [
    'assets/image1.jpeg',
    'assets/image2.jpeg',
    'assets/image3.jpeg',
    'assets/image4.jpeg'
  ]),
  Catalog(
      name: 'двойка',
      images: ['assets/image5.png', 'assets/image6.png', 'assets/image7.png']),
  Catalog(
      name: 'штаны',
      images: ['assets/image8.png', 'assets/image9.png', 'assets/image10.png']),
];

// [
// {
// "title": "Платье",
// "image": "https://i.postimg.cc/BtfW4vmk/IMG-0973.jpg",
// "description": "description 1",
// "id": "1"
// },
// {
// "title": "Костюм двойка",
// "image": "https://i.postimg.cc/GhvtYTnB/Whats-App-Image-2025-01-29-at-10-32-54-2.jpg",
// "description": "description 2",
// "id": "2"
// },
// {
// "title": "Двойка юбка жакет",
// "image": "https://i.postimg.cc/kgc5Yr4q/2025-02-03-230653.png",
// "description": "description 3",
// "id": "3"
// },
// {
// "title": "Платье на запах",
// "image": "https://i.postimg.cc/N0jjWN9T/2025-02-03-230900.png",
// "description": "description 4",
// "id": "4"
// }
// ]
