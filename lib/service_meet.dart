import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/material.dart';

class ServiceMeet {
  ///aun no funciona
  createRomm() {
    final room = JitsiMeet.defaultRoomNameConstraints;
  }

  ///aun no funciona
  _joinMeeting(JitsiMeetingOptions options) async {
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }
}
