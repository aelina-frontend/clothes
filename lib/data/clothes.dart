class Clothes {
  final String title;
  final String image;
  final List<String> images;
  final String description;
  final String fabric;
  final String size;

  Clothes(
      {required this.title,
      required this.image,
      required this.description,
      required this.images,
      required this.fabric,
      required this.size});

  factory Clothes.fromJson(Map<String, dynamic> json) {
    return Clothes(title: json['title'], image: json['image'], description: json['description'], images: List<String>.from(
    json['images']), fabric: json['fabric'], size: json['size']);
  }
}

class Catalog {
  final String name;
  final List<String> images;

  Catalog({required this.name, required this.images});
}

List<Catalog> catalog = [
  Catalog(name: 'кофта', images: [
    'assets/image2.jpg',
    'assets/image1.jpeg',
    'assets/image10.jpg',
  ]),
  Catalog(
      name: 'двойка',
      images: ['assets/image5.png', 'assets/image7.jpg', 'assets/image8.jpg']),
  Catalog(
      name: 'штаны',
      images: ['assets/image6.jpg', 'assets/image11.jpg', 'assets/image3.jpg']),
];

// [
// {
// "title": "Платье",
// "image": "https://i.postimg.cc/SKrFbWzY/IMG-8306.jpg",
// "description": "Нежное женское платье станет идеальным выбором для того, чтобы посетить любой праздник.",
// "images": [
// "https://i.postimg.cc/SKrFbWzY/IMG-8306.jpg",
// "https://i.postimg.cc/PJ00Qy09/IMG-8312.jpg",
// "https://i.postimg.cc/Pr8g5Gwj/IMG-8315.jpg",
// "https://i.postimg.cc/DwrR1q6p/IMG-8319.jpg",
// "https://i.postimg.cc/JhKg2M9b/IMG-8326.jpg",
// "https://i.postimg.cc/W3HysSpz/IMG-8330.jpg"
// ],
// "fabric": "Ткань : Шифон",
// "size": "Размеры : S,M,L,XL,XXL",
// "id": "1"
// },
// {
// "title": "Костюм двойка",
// "image": "https://i.postimg.cc/GhvtYTnB/Whats-App-Image-2025-01-29-at-10-32-54-2.jpg",
// "description": "Спортивная двойка представляет собой идеальный выбор для активных девушек, ищущих комфорт и стиль в одном. ",
// "images": [
// "https://i.postimg.cc/T3ymL9cg/c0533965-6502-4743-8473-5816911c4177.jpg",
// "https://i.postimg.cc/RZjtcHP8/Whats-App-Image-2025-01-29-at-10-32-51.jpg",
// "https://i.postimg.cc/bvktLwWv/Whats-App-Image-2025-01-29-at-10-32-53-1.jpg",
// "https://i.postimg.cc/XJWyP06k/Whats-App-Image-2025-01-29-at-10-32-50-1.jpg"
// ],
// "fabric": "Ткань : Джерси",
// "size": "Размеры : M,L,XL,2XL,3XL,4XL,5XL",
// "id": "2"
// },
// {
// "title": "Костюм с юбкой",
// "image": "https://i.postimg.cc/8k9Tkmsq/im2.png",
// "description": "Костюм женский с мини юбкой и стильным велюровым жакетом на молнии, который с легкостью заменит куртку.",
// "images": [
// "https://i.postimg.cc/8k9Tkmsq/im2.png",
// "https://i.postimg.cc/gkhmxLZr/im1.png",
// "https://i.postimg.cc/KjMS3C4C/im4.png",
// "https://i.postimg.cc/W16VnRSv/im3.png"
// ],
// "fabric": "Ткань : Замша",
// "size": "Размеры : S,M,L",
// "id": "3"
// },
// {
// "title": "Платье летнее с воланами",
// "image": "https://i.postimg.cc/Mp9NsWk1/IMG-8371.jpg",
// "description": "Свободные мини платья это стильное, короткое и нарядное решение для каждой девушки на летнее и осеннее время.",
// "images": [
// "https://i.postimg.cc/XNFMVSF0/IMG-8343.jpg",
// "https://i.postimg.cc/28fsycFL/IMG-8348.jpg",
// "https://i.postimg.cc/QxkRTQ04/IMG-8357.jpg",
// "https://i.postimg.cc/Mp9NsWk1/IMG-8371.jpg"
// ],
// "fabric": "Ткань : Шифон",
// "size": "Размеры : S,M,L,XL",
// "id": "4"
// },
// {
// "title": "Платье на запах",
// "image": "https://i.postimg.cc/HkN3cjDv/IMG-3538.jpg",
// "description": "Платье на запах с поясом - это базовая вещь гардероба каждой женщины.",
// "images": [
// "https://i.postimg.cc/HkN3cjDv/IMG-3538.jpg",
// "https://i.postimg.cc/C5C6b0HB/IMG-3526.jpg",
// "https://i.postimg.cc/25JJD2S6/IMG-3507.jpg",
// "https://i.postimg.cc/VLRV6Yk2/IMG-3513.jpg",
// "https://i.postimg.cc/05GtW8Dr/IMG-3527.jpg"
// ],
// "fabric": "Ткань : Барби",
// "size": "Размеры : S,M,L,XL",
// "id": "5"
// },
// {
// "title": "Платье с резинкой",
// "image": "https://i.postimg.cc/J7dyWXbF/IMG-1272.jpg",
// "description": "Женственное платье с широкой резинкой-венгеркой на линии талии интересный вариант для девушек, которые любят стиль и комфорт. ",
// "images": [
// "https://i.postimg.cc/J7dyWXbF/IMG-1272.jpg",
// "https://i.postimg.cc/qMhNB7wv/IMG-1287.jpg",
// "https://i.postimg.cc/1tX9WWY3/IMG-1302.jpg",
// "https://i.postimg.cc/xCZ9BKWy/IMG-1313.jpg",
// "https://i.postimg.cc/mZc9kV24/IMG-1280.jpg"
// ],
// "fabric": "Ткань : Туран",
// "size": "Размеры : S,M,L,XL",
// "id": "6"
// },
// {
// "title": "Платье летнее мини с рукавами",
// "image": "https://i.postimg.cc/SKCyH2mw/Whats-App-Image-2025-01-29-at-10-13-24-3.jpg",
// "description": "Короткое женское платье имеет легкий и воздушный фасон, отличную посадку и множество принтов и цветовых решений.",
// "images": [
// "https://i.postimg.cc/NMdZnB23/Whats-App-Image-2025-01-29-at-10-13-24-2.jpg",
// "https://i.postimg.cc/Y97p7r9j/Whats-App-Image-2025-01-29-at-10-13-24-1.jpg",
// "https://i.postimg.cc/NGVz2N6k/Whats-App-Image-2025-01-29-at-10-13-24.jpg",
// "https://i.postimg.cc/kM6dHRww/Whats-App-Image-2025-01-29-at-10-13-24-4.jpg"
// ],
// "fabric": "Ткань : Хлопок",
// "size": "Размеры : S,M,L,XL,XXL",
// "id": "7"
// },
// {
// "title": "Платье",
// "image": "https://i.postimg.cc/HsYWQrpz/photo-2025-02-12-11-16-20.jpg",
// "description": "Универсальное платье, с качественной тканью позволяет коже дышать, создавая комфорт в любую погоду.",
// "images": [
// "https://i.postimg.cc/HsYWQrpz/photo-2025-02-12-11-16-20.jpg",
// "https://i.postimg.cc/fWKDTMx9/photo-2025-02-12-11-16-25.jpg",
// "https://i.postimg.cc/5yNcFFwF/photo-2025-02-12-11-16-29.jpg",
// "https://i.postimg.cc/wMWC5TV4/photo-2025-02-12-11-16-32.jpg",
// "https://i.postimg.cc/jqZYYZb6/photo-2025-02-12-11-15-33.jpg",
// "https://i.postimg.cc/NfFqsms3/photo-2025-02-12-11-16-16.jpg"
// ],
// "fabric": "Ткань : Барди ",
// "size": "Размеры : M-L-XL-2XL-3XL-4XL",
// "id": "8"
// },
// {
// "title": "Двойка из флиса",
// "image": "https://i.postimg.cc/k4sz9XkM/photo-2025-02-12-11-16-42.jpg",
// "description": "Универсальный стиль: будь то прогулка, поездка или отдых – наши вещи впишутся в любую ситуацию.Тёплый и лёгкий комплект, который станет незаменимой частью гардероба в холодное время года.",
// "images": [
// "https://i.postimg.cc/k4sz9XkM/photo-2025-02-12-11-16-42.jpg",
// "https://i.postimg.cc/fWHprycB/photo-2025-02-12-11-16-40.jpg",
// "https://i.postimg.cc/hv3YzZDH/photo-2025-02-12-11-16-36.jpg",
// "https://i.postimg.cc/xTchDQgY/photo-2025-02-12-11-16-45.jpg",
// "https://i.postimg.cc/D0mjTQr5/photo-2025-02-12-11-16-47.jpg"
// ],
// "fabric": "Ткань : Премиальный флис",
// "size": "Размеры : S,M,L",
// "id": "9"
// }
// ]
