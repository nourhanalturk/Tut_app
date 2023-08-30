import 'package:tut_app/presentation/base/baseviewmodel.dart';

class OnboardingViewModel extends BaseViewModel with OnboardingViewModelInputs ,OnboardingViewModelOutputs{

  // onboarding view model inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void getNext() {
    // TODO: implement getNext
  }

  @override
  void getPrevious() {
    // TODO: implement getPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

}

// inputs means "ORDERS" that view model will receive from view
mixin OnboardingViewModelInputs {
  void getNext(); //when user click on the right arrow or swipe left
  void getPrevious ();//when user click on the left arrow or swipe right
  void onPageChanged(int index);

}
mixin OnboardingViewModelOutputs{

}