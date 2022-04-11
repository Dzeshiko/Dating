import 'dart:math';

import 'package:dating/domain/model/dating_image.dart';
import 'package:dating/domain/repository/dating_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'dating_state.g.dart';

class DatingState = DatingStateBase with _$DatingState;

abstract class DatingStateBase with Store {
  final DatingRepository datingRepository;
  DatingStateBase(this.datingRepository);

  Random random = Random();
  @observable
  PageController datingPageController = PageController();
  @observable
  bool imagesLoaded = false;
  @observable
  List<DatingImage?>? images;

  @observable
  int randomItem = 0;
  @observable
  int countLikeGrid = 0;
  @observable
  int previousIndex = 99;

  List<Map<String, dynamic>> chosen = [];

  @action
  Future<void> getImages(int cid) async {
    randomItem = random.nextInt(11);
    countLikeGrid = 0;
    previousIndex = 99;
    images = await datingRepository.getDatingImages(cid: cid);
    imagesLoaded = true;
  }

  @action
  Future<void> reloadImages(int cid) async {
    randomItem = random.nextInt(11);
    countLikeGrid = 0;
    previousIndex = 99;
    imagesLoaded = false;
    images = await datingRepository.getDatingImages(cid: cid);
    imagesLoaded = true;
  }

  @action
  void nextPage(int cid) {
    datingPageController.animateToPage(
      cid,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    imagesLoaded = false;
    images = null;
    randomItem = random.nextInt(11);
    countLikeGrid = 0;
    previousIndex = 99;
  }
}
