import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_midi_command/flutter_midi_command.dart';
import 'package:file_picker/file_picker.dart' as mobilePicker;
import 'package:file_picker_desktop/file_picker_desktop.dart' as desktopPicker;

import 'package:oxi_companion_flttr/models/midi_device_model.dart';
import 'oxi_one.dart' as oxiOne;

import 'package:oxi_companion_flttr/common/oxi_theme.dart';

class UpdateSelect extends StatefulWidget {
  @override
  _UpdateSelectState createState() => _UpdateSelectState();
}

class _UpdateSelectState extends State<UpdateSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OxiAppBar(
        title: Text(
          "Install Update",
          style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 24
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 80.0,
                  child: Text("Your Oxi One firmware is up2date!"),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: _selectUpdate,
                    child: Text(
                        "I feel adventurous!",
                        style: TextStyle(
                          fontSize: 12.0
                        ),
                    )
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      )
    );
  }

  void _clickDummy() {
    dev.log("klick klock");
  }

  void _selectUpdate() async {
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      desktopPicker.FilePickerResult? result = await desktopPicker.pickFiles(
        dialogTitle: "Select update file",
        allowedExtensions: ["syx"],
        type: desktopPicker.FileType.custom
      );
    } else {
      mobilePicker.FilePickerResult? result = await mobilePicker.FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path as String);
        dev.log(file.path);
      }
    }
    Navigator.of(context).pushNamedAndRemoveUntil('/updater', (_)=>(false));
  }
}