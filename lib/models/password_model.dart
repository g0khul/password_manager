class Password {
  final String id;
  final String title;
  final String username;
  final String password;
  final String? website;
  final String? notes;

  Password({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
    this.website,
    this.notes,
  });
}
