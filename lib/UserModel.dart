class User {
  late String userId;
  late String fullname;
  late String email;
  late String phoneNo;



  User(
      {required this.userId,
      required this.fullname,
      required this.email,
      required this.phoneNo,
     
      });

  User.fromJson(Map<String, dynamic> json, [param1]) {
    userId = json['userId'];
    fullname = json['username'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.fullname;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    
    return data;
  }
}