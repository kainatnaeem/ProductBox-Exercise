class Comment {
  String authorName;
  String authorImageUrl;
  String text;

  Comment({
    required this.authorName,
    required this.authorImageUrl,
    required this.text,
  });
}

final List<Comment> comments = [
  Comment(
    authorName: 'Aleesha',
    authorImageUrl: 'assets/mine.png',
    text: 'woah!!',
  ),
  Comment(
    authorName: 'Arsal',
    authorImageUrl: 'assets/mine.png',
    text: 'cool',
  ),
  Comment(
    authorName: 'elizbeth',
    authorImageUrl: 'assets/mine.png',
    text: 'stunning',
  ),
  Comment(
    authorName: 'Jax',
    authorImageUrl: 'assets/mine.png',
    text: 'Nice job',
  ),
];
