part of stringer;

class TextClipBoard {
  // -----------------------------------------------------------------------------

  const TextClipBoard();

  // -----------------------------------------------------------------------------

  /// COPY

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> copy({
    @required BuildContext context,
    @required String copy,
  }) async {

    await Clipboard.setData(
        ClipboardData(
          text: copy,
        )
    );

  }
  // -----------------------------------------------------------------------------

  /// PASTE

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<String> paste() async {
    final String _text = await FlutterClipboard.paste();
    return _text;
  }
  // -----------------------------------------------------------------------------
}
