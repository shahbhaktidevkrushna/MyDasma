// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  bool? status;
  bool? error;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    error: json["error"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.dob,
    this.email,
    this.countryId,
    this.cityId,
    this.houseNo,
    this.street,
    this.suburb,
    this.postcode,
    this.password,
    this.fakePass,
    this.profilePhoto,
    this.uploadId,
    this.status,
    this.isSubscribed,
    this.isVerified,
    this.planId,
    this.paypalPlanId,
    this.subscriptionStatus,
    this.subscribedDate,
    this.loginCount,
    this.source,
    this.relationStatus,
    this.event,
    this.eventOther,
    this.created,
    this.modified,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? dob;
  String? email;
  String? countryId;
  String? cityId;
  String? houseNo;
  String? street;
  String? suburb;
  String? postcode;
  String? password;
  dynamic fakePass;
  dynamic profilePhoto;
  dynamic uploadId;
  String? status;
  String? isSubscribed;
  String? isVerified;
  dynamic planId;
  dynamic paypalPlanId;
  String? subscriptionStatus;
  dynamic subscribedDate;
  String? loginCount;
  String? source;
  dynamic relationStatus;
  dynamic event;
  dynamic eventOther;
  String? created;
  String? modified;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    mobile: json["mobile"],
    dob: json["dob"],
    email: json["email"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    houseNo: json["house_no"],
    street: json["street"],
    suburb: json["suburb"],
    postcode: json["postcode"],
    password: json["password"],
    fakePass: json["fake_pass"],
    profilePhoto: json["profile_photo"],
    uploadId: json["upload_id"],
    status: json["status"],
    isSubscribed: json["is_subscribed"],
    isVerified: json["is_verified"],
    planId: json["plan_id"],
    paypalPlanId: json["paypal_plan_id"],
    subscriptionStatus: json["subscription_status"],
    subscribedDate: json["subscribed_date"],
    loginCount: json["login_count"],
    source: json["source"],
    relationStatus: json["relation_status"],
    event: json["event"],
    eventOther: json["event_other"],
    created: json["created"],
    modified: json["modified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "mobile": mobile,
    "dob": dob,
    "email": email,
    "country_id": countryId,
    "city_id": cityId,
    "house_no": houseNo,
    "street": street,
    "suburb": suburb,
    "postcode": postcode,
    "password": password,
    "fake_pass": fakePass,
    "profile_photo": profilePhoto,
    "upload_id": uploadId,
    "status": status,
    "is_subscribed": isSubscribed,
    "is_verified": isVerified,
    "plan_id": planId,
    "paypal_plan_id": paypalPlanId,
    "subscription_status": subscriptionStatus,
    "subscribed_date": subscribedDate,
    "login_count": loginCount,
    "source": source,
    "relation_status": relationStatus,
    "event": event,
    "event_other": eventOther,
    "created": created,
    "modified": modified,
  };
}
