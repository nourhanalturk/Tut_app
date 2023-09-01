import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status") // matched api
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id") // matched api
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotification")
  int? numOfNotification;

  CustomerResponse(this.name,this.id,this.numOfNotification);
  //from json (json response => class of type AuthenticationResponse)
  factory CustomerResponse.fromJson (Map<String,dynamic>json)=> _$CustomerResponseFromJson(json);
  //to json (class of type AuthenticationResponse => json)
  Map<String,dynamic> toJson ()=>_$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;

  ContactsResponse(this.phone,this.email,this.link);

  //from json (json response => class of type AuthenticationResponse)
  factory ContactsResponse.fromJson (Map<String,dynamic>json)=> _$ContactsResponseFromJson(json);
  //to json (class of type AuthenticationResponse => json)
  Map<String,dynamic> toJson ()=>_$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer,this.contacts);

  //from json (json response => class of type AuthenticationResponse)
  factory AuthenticationResponse.fromJson (Map<String,dynamic>json)=> _$AuthenticationResponseFromJson(json);
  //to json (class of type AuthenticationResponse => json)
  Map<String,dynamic> toJson ()=>_$AuthenticationResponseToJson(this);
}