import 'dart:async';
import 'dart:ffi';

import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/presentation/base/baseviewmodel.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel with OnboardingViewModelInputs ,OnboardingViewModelOutputs{

  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list ;
  int _currentIndex = 0;

  // onboarding view model inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job (call api ,git data ,....).
    _list = _getSliderData(); //initialize list
    _PostDataToView();
  }

  @override
  int getNext() {
    int nextIndex = ++_currentIndex ;
    if (nextIndex ==_list.length) {
      nextIndex =0;
    }
    return nextIndex ;  }

  @override
  int getPrevious() {
    int previousIndex = --_currentIndex ;
    if (previousIndex ==-1) {
      previousIndex =_list.length -1;
    }
    return previousIndex ;  }

  @override
  void onPageChanged(int index) {
    _currentIndex =index;
    _PostDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;



  // onboarding view model outputs
  @override
  Stream<SliderViewObject> get outputSliderObject =>_streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4,
        AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
  ];
  void _PostDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// inputs means "ORDERS" that view model will receive from view
mixin OnboardingViewModelInputs {
  int getNext(); //when user click on the right arrow or swipe left
  int getPrevious ();//when user click on the left arrow or swipe right
  void onPageChanged(int index);

  //stream controller input
Sink get inputSliderViewObject ;

}
mixin OnboardingViewModelOutputs{
  //stream controller output
  Stream<SliderViewObject> get outputSliderObject ;

}