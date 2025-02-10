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
// "title": "Платье с длинным рукавом",
// "image": "https://i.postimg.cc/SKrFbWzY/IMG-8306.jpg",
// "description": "description 1",
// "images": [
// "https://i.postimg.cc/SKrFbWzY/IMG-8306.jpg",
// "https://i.postimg.cc/PJ00Qy09/IMG-8312.jpg",
// "https://i.postimg.cc/Pr8g5Gwj/IMG-8315.jpg",
// "https://i.postimg.cc/DwrR1q6p/IMG-8319.jpg",
// "https://i.postimg.cc/JhKg2M9b/IMG-8326.jpg",
// "https://i.postimg.cc/W3HysSpz/IMG-8330.jpg"
// ],
// "id": "1"
// },
// {
// "title": "Костюм двойка",
// "image": "https://i.postimg.cc/GhvtYTnB/Whats-App-Image-2025-01-29-at-10-32-54-2.jpg",
// "description": "description 2",
// "images": [
// "https://i.postimg.cc/T3ymL9cg/c0533965-6502-4743-8473-5816911c4177.jpg",
// "https://i.postimg.cc/RZjtcHP8/Whats-App-Image-2025-01-29-at-10-32-51.jpg",
// "https://i.postimg.cc/bvktLwWv/Whats-App-Image-2025-01-29-at-10-32-53-1.jpg",
// "https://i.postimg.cc/XJWyP06k/Whats-App-Image-2025-01-29-at-10-32-50-1.jpg"
// ],
// "id": "2"
// },
// {
// "title": "Костюм с юбкой замшевый двойка",
// "image": "https://i.postimg.cc/8k9Tkmsq/im2.png",
// "description": "description 1",
// "images": [
// "https://i.postimg.cc/8k9Tkmsq/im2.png",
// "https://i.postimg.cc/gkhmxLZr/im1.png",
// "https://i.postimg.cc/KjMS3C4C/im4.png",
// "https://i.postimg.cc/W16VnRSv/im3.png"
// ],
// "id": "3"
// },
// {
// "title": "Платье на запах миди",
// "image": "https://i.postimg.cc/Mp9NsWk1/IMG-8371.jpg",
// "description": "description 4",
// "images": [
// "https://i.postimg.cc/XNFMVSF0/IMG-8343.jpg",
// "https://i.postimg.cc/28fsycFL/IMG-8348.jpg",
// "https://i.postimg.cc/QxkRTQ04/IMG-8357.jpg",
// "https://i.postimg.cc/Mp9NsWk1/IMG-8371.jpg"
// ],
// "id": "4"
// },
// {
// "title": "Платье",
// "image": "https://i.postimg.cc/25JJD2S6/IMG-3507.jpg",
// "description": "description 1",
// "images": [
// "https://i.postimg.cc/25JJD2S6/IMG-3507.jpg",
// "https://i.postimg.cc/C5C6b0HB/IMG-3526.jpg",
// "https://i.postimg.cc/VLRV6Yk2/IMG-3513.jpg",
// "https://i.postimg.cc/05GtW8Dr/IMG-3527.jpg",
// "https://i.postimg.cc/HkN3cjDv/IMG-3538.jpg"
// ],
// "id": "5"
// },
// {
// "title": "Платье",
// "image": "https://i.postimg.cc/J7dyWXbF/IMG-1272.jpg",
// "description": "description 1",
// "images": [
// "https://i.postimg.cc/J7dyWXbF/IMG-1272.jpg",
// "https://i.postimg.cc/qMhNB7wv/IMG-1287.jpg",
// "https://i.postimg.cc/1tX9WWY3/IMG-1302.jpg",
// "https://i.postimg.cc/xCZ9BKWy/IMG-1313.jpg",
// "https://i.postimg.cc/mZc9kV24/IMG-1280.jpg"
// ],
// "id": "6"
// },
// {
// "title": "Платье с резинкой с длинным рукавом",
// "image": "https://i.postimg.cc/SKCyH2mw/Whats-App-Image-2025-01-29-at-10-13-24-3.jpg",
// "description": "description 1",
// "images": [
// "https://i.postimg.cc/Y97p7r9j/Whats-App-Image-2025-01-29-at-10-13-24-1.jpg",
// "https://i.postimg.cc/NMdZnB23/Whats-App-Image-2025-01-29-at-10-13-24-2.jpg",
// "https://i.postimg.cc/NGVz2N6k/Whats-App-Image-2025-01-29-at-10-13-24.jpg",
// "https://i.postimg.cc/kM6dHRww/Whats-App-Image-2025-01-29-at-10-13-24-4.jpg"
// ],
// "id": "7"
// },
// ]