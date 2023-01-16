import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/image_model.dart';
import '../Services/api_service.dart';

class HomePageController extends GetxController {
  List<UnSplashImageModel> imagesList = [];
  int _pageNumber = 1;
  bool _loading = false;
  late final ApiService _apiService;

  late final ScrollController _scrollController;

  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    _apiService = ApiService();
    _scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onReady() {
    _fetchImagesFromApi();
    _fetchImagesOnListScroll();
    super.onReady();
  }

  _fetchImagesOnListScroll() {
    _scrollController.addListener(() {
      double nextPageTrigger = _scrollController.position.maxScrollExtent * 0.8;

      if (_scrollController.position.pixels > nextPageTrigger && !_loading) {
        _loading = true;
        _fetchImagesFromApi();
      }
    });
  }

  _fetchImagesFromApi() async {
    List<UnSplashImageModel> tempList =
        await _apiService.getRandomImages(_pageNumber);

    if (tempList.isNotEmpty) {
      imagesList.addAll(tempList);
      _pageNumber++;
    }
    _loading = false;
    update();
  }
}
