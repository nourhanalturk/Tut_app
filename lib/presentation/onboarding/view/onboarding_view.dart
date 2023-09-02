import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constant_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/routs_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnboardingViewModel _viewModel = OnboardingViewModel();
  _bind(){
    _viewModel.start();
  }
@override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderObject,
        builder:(context, snapshot) {
          return _getContentWidget(snapshot.data);
        },
    );
  }

  Widget _getContentWidget (SliderViewObject? sliderViewObject){
    if(sliderViewObject ==null ){
      return Container();
    }else{
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
      ),
      body: PageView.builder(
        controller:_pageController ,
        itemCount:sliderViewObject.numOfSlides,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(sliderViewObject.sliderObject) ;
        },
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, Routs.loginRout);
                },
                child:  Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetWidget(sliderViewObject),
          ],
        ),
      ),
    );}
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: (){
                print('hi');
                _pageController.animateToPage(
                    _viewModel.getPrevious(),
                    duration: const Duration(milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut
                );
              },
            ),
          ),
          // circle indicator,
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i,sliderViewObject.currentIndex),
                )
            ],
          ),
          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: (){
                _pageController.animateToPage(
                    _viewModel.getNext(),
                    duration: const Duration(milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut
                );
              },
            ),
          )
        ],
      ),
    );
  }
  Widget _getProperCircle(int index , int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }


}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject ;
  const OnBoardingPage(this._sliderObject,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}


