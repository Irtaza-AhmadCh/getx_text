class ProfileModel {
  final String name;
  final String email;
  final String userId;

  final String address;
  final String imageUrl;
  ProfileModel(
      {required this.name,
        required this.userId,
        required this.email,
      required this.address,
      required this.imageUrl});
}
