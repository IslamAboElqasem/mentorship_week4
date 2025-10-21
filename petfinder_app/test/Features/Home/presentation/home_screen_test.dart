import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petfinder_app/Core/di/injection_container.dart';
import 'package:petfinder_app/Features/Home/data/model/cat_model.dart';
import 'package:petfinder_app/Features/Home/presentation/home_screen.dart';
import 'package:petfinder_app/Features/Home/data/repo/cat_repository.dart';

/// 🔹 Mock class for CatRepository
class MockCatRepository extends Mock implements CatRepository {}

void main() {
  late MockCatRepository mockCatRepository;

  setUpAll(() async {
    await setupServiceLocator();

    // unregister the real repo if it's already registered
    if (sl.isRegistered<CatRepository>()) {
      sl.unregister<CatRepository>();
    }

    // register our mock repository
    mockCatRepository = MockCatRepository();
    sl.registerLazySingleton<CatRepository>(() => mockCatRepository);
  });
  testWidgets('Display loading indicator while fetching cats', (tester) async {
    final completer = Completer<List<CatModel>>();
    when(() => mockCatRepository.getCats()).thenAnswer((_) => completer.future);

    // 🔹 Build widget tree
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return const MaterialApp(home: HomeScreen());
        },
      ),
    );

    // 🔹 Initially, the state is CatLoading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Display list of cats when fetching succeeds', (tester) async {
    when(() => mockCatRepository.getCats()).thenAnswer((_) async => [
          CatModel(
              name: 'Jerry',
              origin: 'USA',
              lifeSpan: '12-15',
              imageUrl: 'https://cdn2.thecatapi.com/images/IFXsxmXLm.jpg',
              id: '1'),
          CatModel(
              name: 'Tom',
              origin: 'UK',
              lifeSpan: '10-14',
              imageUrl: 'https://cdn2.thecatapi.com/images/VZ3qFLIe3.jpg',
              id: '2'),
        ]);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return const MaterialApp(home: HomeScreen());
        },
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Tom'), findsOneWidget);
    expect(find.text('Jerry'), findsOneWidget);

    expect(find.byKey(const Key('catListView')), findsOneWidget);
  });

  testWidgets('Display error message when repository throws', (tester) async {
    // 🔹 Make repository throw exception
    when(() => mockCatRepository.getCats())
        .thenThrow(Exception('Network Error'));

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return const MaterialApp(home: HomeScreen());
        },
      ),
    );

    // wait for the cubit to emit error state
    await tester.pumpAndSettle();

    // 🔹 Verify the error message appears
    expect(find.textContaining('Error:'), findsOneWidget);
  });
}
