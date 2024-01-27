class User {
  final String firstName;
  final String lastName;
  final int phoneNumber;
  final String password;
  final String userType;
  final String profileImageUrl;

  const User({
    required this.profileImageUrl,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    final firstName = userJson['first_name'] as String?;
    final lastName = userJson['last_name'] as String?;
    final phoneNumber = int.tryParse(userJson['phone_number'] ?? '');
    final userType = userJson['role'] as String?;
    final profileImageUrl = userJson['profile_image'] ?? '';

    if (firstName != null &&
        lastName != null &&
        phoneNumber != null &&
        userType != null) {
      return User(
        profileImageUrl: profileImageUrl,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        password: '',
        userType: userType,
      );
    } else {
      throw const FormatException('Failed to load user.');
    }
  }

  toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'password': password,
      'role': userType,
      'profile_image': profileImageUrl
    };
  }
}
