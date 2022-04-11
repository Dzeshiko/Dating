class ApiDatingImage {
  final int id;
  final String name;
  final String username;
  final String avatar;
  final int hero;

  ApiDatingImage.fromApi(Map<String, dynamic> map)
      : id = map['user_id'],
        name = map['name'],
        username = map['username'],
        avatar = map['avatar'],
        hero = 1;
}
