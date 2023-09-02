
import 'package:tut_app/app/constants.dart';
import 'package:tut_app/app/extentions.dart';
import 'package:tut_app/domain/model/models.dart';

import '../response/response.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty,
        this?.numOfNotification.orZero()?? Constants.zero
    );
}

}
extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
    );
  }

}

extension AuthenticationResponseMapper on AuthenticationResponse? {
Authentication toDomain() {
  return Authentication(
    this?.customer.toDomain(),
    // if the Customer obj is not nullable i should make an empty instance here (its a wrong way..suppose i have a lot of parameters !! )
    this?.contacts.toDomain(),
  );
}

}