// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' 
    hide EmailAuthProvider, PhoneAuthProvider;    
import 'package:flutter/material.dart';
import 'package:gtk_flutter/yes_no_selection.dart';           
import 'package:provider/provider.dart';          

import 'app_state.dart';                          
import 'src/authentication.dart';                 
import 'src/widgets.dart';
import 'guest_book.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Meetup'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/codelab.png'),
          const SizedBox(height: 8),
          const IconAndDetail(Icons.calendar_today, 'October 30'),
          const IconAndDetail(Icons.location_city, 'San Francisco'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                switch (appState.attendees) {
                1 => const Paragraph('1 person going'),
                >= 2 => Paragraph('${appState.attendees} people going'),
                 _ => const Paragraph('No one going'),
                },
                if (appState.loggedIn) ...[
                  YesNoSelection(
                  state: Attending.no,
                  onSelection: (attending) => appState.attending = 0,
                  ),
                  const Header('Discussion'),
                  GuestBook(
                    addMessage: (message) =>
                    appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessages,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
