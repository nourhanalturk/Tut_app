// onboarding models .
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject { // data that we will pass from view model to the view
  SliderObject sliderObject ;
  int numOfSlides ;
  int currentIndex ;
  SliderViewObject(this.sliderObject,this.numOfSlides,this.currentIndex);
}

//login models
class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;
  // accept null because i don't need to create an empty value to obj we can do it easily with primitive types

  Authentication(this.customer, this.contacts);
}