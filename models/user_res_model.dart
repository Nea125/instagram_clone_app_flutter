//class UserResModel {
//   User? user;
//   String? accessToken;
//   UserResModel({this.user, this.accessToken});
//   UserResModel.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     accessToken = json['accessToken'];
//   }

//   get data => null; 

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['accessToken'] = accessToken;
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? profileUrl;
//   String? shortBio;
//   int ? isActive;

//   User(
//       {this.id,
//       this.name,
//       this.email,
//       this.profileUrl,
//       this.shortBio,
//       this.isActive});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     profileUrl = json['profile_url'];
//     shortBio = json['short_bio'];
//     isActive = json['is_active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['profile_url'] = profileUrl;
//     data['short_bio'] = shortBio;
//     data['is_active'] = isActive;
//     return data;
//   }
//}



class UserResModel {
  User? user;
  String? accessToken;

  UserResModel({this.user, this.accessToken});

  UserResModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profileUrl;
  String? shortBio;
  int? isActive;

  User(
      {this.id,
      this.name,
      this.email,
      this.profileUrl,
      this.shortBio,
      this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileUrl = json['profile_url'];
    shortBio = json['short_bio'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_url'] = this.profileUrl;
    data['short_bio'] = this.shortBio;
    data['is_active'] = this.isActive;
    return data;
  }
}


