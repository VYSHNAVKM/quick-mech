
class FavouriteModel {
  static List mechimage = [
    'https://cdn1.vectorstock.com/i/1000x1000/23/65/man-avatar-icon-flat-vector-19152365.jpg',
    'https://cdn1.vectorstock.com/i/1000x1000/23/70/man-avatar-icon-flat-vector-19152370.jpg'
  ];
  static List mechlist = ['Saju', 'ragav', 'ashfak', 'ashiq'];
  static List mechrating = ['40', '23', '34'];
  Item getById(int id) => Item(
      id,
      mechlist[id % mechlist.length].toString(),
      mechimage[id % mechimage.length],
      mechrating[id % mechrating.length].toString());

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String image;
  final String ratting;

  Item(this.id, this.name, this.image, this.ratting);
  @override
  int get hashcode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
