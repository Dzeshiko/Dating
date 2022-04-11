// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dating_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DatingState on DatingStateBase, Store {
  final _$datingPageControllerAtom =
      Atom(name: 'DatingStateBase.datingPageController');

  @override
  PageController get datingPageController {
    _$datingPageControllerAtom.reportRead();
    return super.datingPageController;
  }

  @override
  set datingPageController(PageController value) {
    _$datingPageControllerAtom.reportWrite(value, super.datingPageController,
        () {
      super.datingPageController = value;
    });
  }

  final _$imagesLoadedAtom = Atom(name: 'DatingStateBase.imagesLoaded');

  @override
  bool get imagesLoaded {
    _$imagesLoadedAtom.reportRead();
    return super.imagesLoaded;
  }

  @override
  set imagesLoaded(bool value) {
    _$imagesLoadedAtom.reportWrite(value, super.imagesLoaded, () {
      super.imagesLoaded = value;
    });
  }

  final _$imagesAtom = Atom(name: 'DatingStateBase.images');

  @override
  List<DatingImage?>? get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<DatingImage?>? value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$randomItemAtom = Atom(name: 'DatingStateBase.randomItem');

  @override
  int get randomItem {
    _$randomItemAtom.reportRead();
    return super.randomItem;
  }

  @override
  set randomItem(int value) {
    _$randomItemAtom.reportWrite(value, super.randomItem, () {
      super.randomItem = value;
    });
  }

  final _$countLikeGridAtom = Atom(name: 'DatingStateBase.countLikeGrid');

  @override
  int get countLikeGrid {
    _$countLikeGridAtom.reportRead();
    return super.countLikeGrid;
  }

  @override
  set countLikeGrid(int value) {
    _$countLikeGridAtom.reportWrite(value, super.countLikeGrid, () {
      super.countLikeGrid = value;
    });
  }

  final _$previousIndexAtom = Atom(name: 'DatingStateBase.previousIndex');

  @override
  int get previousIndex {
    _$previousIndexAtom.reportRead();
    return super.previousIndex;
  }

  @override
  set previousIndex(int value) {
    _$previousIndexAtom.reportWrite(value, super.previousIndex, () {
      super.previousIndex = value;
    });
  }

  final _$getImagesAsyncAction = AsyncAction('DatingStateBase.getImages');

  @override
  Future<void> getImages(int cid) {
    return _$getImagesAsyncAction.run(() => super.getImages(cid));
  }

  final _$reloadImagesAsyncAction = AsyncAction('DatingStateBase.reloadImages');

  @override
  Future<void> reloadImages(int cid) {
    return _$reloadImagesAsyncAction.run(() => super.reloadImages(cid));
  }

  final _$DatingStateBaseActionController =
      ActionController(name: 'DatingStateBase');

  @override
  void nextPage(int cid) {
    final _$actionInfo = _$DatingStateBaseActionController.startAction(
        name: 'DatingStateBase.nextPage');
    try {
      return super.nextPage(cid);
    } finally {
      _$DatingStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
datingPageController: ${datingPageController},
imagesLoaded: ${imagesLoaded},
images: ${images},
randomItem: ${randomItem},
countLikeGrid: ${countLikeGrid},
previousIndex: ${previousIndex}
    ''';
  }
}
