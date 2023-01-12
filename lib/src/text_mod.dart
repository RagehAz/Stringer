import 'package:flutter/material.dart';

class TextMod {
  // -----------------------------------------------------------------------------

  const TextMod();

  // -----------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  static String removeSpacesFromAString(String string) {
    String _output5;

    if (string != null) {
      /// solution 1,, won't work, not tested
      // string.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
      /// solution 2
      // string.replaceAll(new RegExp(r"\s+"), "");
      /// solution 3
      // string.replaceAll(' ', '');
      /// solution 4
      // string.split(" ").join("");
      /// solution 5
      final String _output = string.toLowerCase().replaceAll(' ', '');

      /// solution 6
      /// String replaceWhitespacesUsingRegex(String s, String replace) {
      ///   if (s == null) {
      ///     return null;
      ///   }
      ///
      ///   // This pattern means "at least one space, or more"
      ///   // \\s : space
      ///   // +   : one or more
      ///   final pattern = RegExp('\\s+');
      ///   return s.replaceAll(pattern, replace);
      ///
      /// ---> I'm just going to shortcut the above method here below
      // string?.replaceAll(new RegExp('\\s+'),'');
      final String _output2 = _output?.replaceAll('‎', '');
      final String _output3 = _output2?.replaceAll('‏', '');
      final String _output4 = _output3?.replaceAll('‎ ', '');
      _output5 = _output4?.replaceAll(' ‏', '');
    }

    return _output5;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String removeTextBeforeFirstSpecialCharacter(String verse, String specialCharacter) {
    String _result = verse;

    if (verse != null && verse != ''){

      final bool _verseContainsChar = stringContainsSubString(
        string: verse,
        subString: specialCharacter,
      );

      if (_verseContainsChar == true) {
        final int _position = verse?.indexOf(specialCharacter);
        _result = verse == null ?
        null
            :
        (_position != -1) ?
        verse.substring(_position + 1, verse.length)
            :
        verse;
      }

    }

    return _result;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static bool stringContainsSubString({
    @required String string,
    @required String subString,
  }) {
    bool _itContainsIt = false;

    if (string != null && subString != null) {
      if (
      string.toLowerCase().contains(subString?.toLowerCase())
      ) {
        _itContainsIt = true;
      }
    }

    return _itContainsIt;
  }
  // --------------------
}
