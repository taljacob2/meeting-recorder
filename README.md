# meeting-recorder

If you own a *Windows* machine, you may run these VBScript files to schedule a recording for a video-conference meeting.

You may run these scripts in any *Windows* machine, to record meetings of:
- [Zoom][Zoom Script]
- [Google Meets][Google Meets Script]

## Installation:

1. We use [Google Chrome] and [Apowersoft] to record the meetings.
So make sure you download and install them, before you run the scripts.

2. Open one of the specified above scripts, and edit it to match your meeting's settings.
    > For example, to record a *"Zoom"* meeting, we will open the [Zoom][Zoom Script] script, and edit it so that:
    > - Its URL link matches the meeting's URL.
    > - Its schedule timer, of the "start record" and "stop record" would be set as we wish.

3. Run the script, by simply double-clicking it.

[Google Chrome]: https://www.google.com/intl/en/chrome/
[Apowersoft]: https://www.apowersoft.com/free-online-screen-recorder

[Zoom Script]: src/zoom-meeting-recorder.vbs
[Google Meets Script]: src/google-meets-recorder.vbs