class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Kainat Naeem',
    authorImageUrl: 'assets/mine.png',
    timeAgo: '10 min',
    imageUrl: 'assets/mine.png',
  ),
  Post(
    authorName: 'Kainat Naeem',
    authorImageUrl: 'assets/mine.png',
    timeAgo: '20 min',
    imageUrl: 'assets/mine.png',
  ),
];

final List<String> stories = [
  'assets/mine.png',
  'assets/mine.png',
  'assets/mine.png',
  'assets/mine.png',
  'assets/mine.png',
  'assets/mine.png',
  'assets/mine.png',
  'assets/mine.png',
];
