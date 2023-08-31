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