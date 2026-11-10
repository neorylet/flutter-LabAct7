// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tubera_task7_social_media/main.dart';
import 'package:tubera_task7_social_media/model/userdata.dart';
import 'package:tubera_task7_social_media/views/postlist.dart';

void main() {
  testWidgets('App opens the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('TIKTOK'), findsOneWidget);
    expect(find.text('Enter Username'), findsOneWidget);
  });

  testWidgets('comments are added to their post and shown in the feed', (
    WidgetTester tester,
  ) async {
    final userdata = Userdata();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView(children: [Postlist(userdata: userdata)]),
        ),
      ),
    );

    final commentButton = find.widgetWithText(TextButton, 'comment').first;
    await tester.ensureVisible(commentButton);
    await tester.tap(commentButton);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'A new comment');
    await tester.testTextInput.receiveAction(TextInputAction.send);
    await tester.pumpAndSettle();

    expect(find.text('A new comment'), findsOneWidget);
    expect(userdata.userList.first.numComments, 4);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('4 Comments'), findsOneWidget);
    expect(userdata.userList[1].numComments, 0);
  });
}
