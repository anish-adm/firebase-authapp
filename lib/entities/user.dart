class User{
  static final String tableName = 'user';
  static String columnId = 'id';
  static String columnEmailName = 'email';
  static String columnTokenName = 'token';
  int id;
  String email, token;
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnEmailName: email,
      columnTokenName: token,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  User({this.token, this.email});

  User.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    email = map[columnEmailName];
    token = map[columnTokenName];
  }

  @override
  String toString() {
    return "{id: $id, Token: $token, email: $email}";
  }
}