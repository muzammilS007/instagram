class SignUp {
  String? firstName;
  String? email;
  String? password;
  String? imagePath;
  String? aboutInfo;
  String? location;
  String? phoneNumber;
  String? dateTime;
  String? userId;

  SignUp(
      {this.firstName, this.email, this.password, this.imagePath, this.phoneNumber, this.location, this.aboutInfo, this.dateTime, this.userId});

  SignUp.fromJson(Map<String, Object?> json)
      : this(
    firstName: json['firstName']! as String,
    email: json['email']! as String,
    password: json['password']! as String,
    imagePath: json['imagePath']! as String,
    aboutInfo: json['aboutInfo']! as String,
    location: json['location']! as String,
    phoneNumber: json['phoneNumber']! as String,
    dateTime: json['dateTime']! as String,
    userId: json['userId']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'email': email,
      'password': password,
      'imagePath': imagePath,
      'aboutInfo': aboutInfo,
      'location': location,
      'phoneNumber': phoneNumber,
      'dateTime': dateTime,
      'userId': userId,
    };
  }
}