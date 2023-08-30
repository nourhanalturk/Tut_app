abstract class BaseViewModel extends BaseViewModelInputs with  BaseViewModelOutputs {
  //shared variables and function that will be used in any view model .
}

abstract class BaseViewModelInputs {
  void start (); //start view model job
  void dispose(); //will be called when view model dies
  //when the view that is related to the view model disposed  then also the view model to disposed (async function ,streams ,..)
}

 mixin BaseViewModelOutputs{
}