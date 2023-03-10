// ignore_for_file: noop_primitive_operations
part of stringer;

/// => TAMAM
class Stringer {
  // -----------------------------------------------------------------------------

  const Stringer();

  // -----------------------------------------------------------------------------

  /// CLONING

  // --------------------
  /*
  static List<String> cloneListOfStrings(List<String> list) {
    final List<dynamic> _newList = <dynamic>[];

    for (final String x in list) {
      _newList.add(x);
    }
    return _newList;
  }
   */
  // -----------------------------------------------------------------------------

  /// CHECKERS

  // --------------------
  /// AI TESTED
  static bool checkStringsContainString({
    @required List<String> strings,
    @required String string,
  }) {
    bool _containsIt = false;

    if (Mapper.checkCanLoopList(strings) == true && string != null) {
      _containsIt = strings.contains(string);
    }

    return _containsIt;
  }
  // -----------------------------------------------------------------------------

  /// MODIFIERS

  // --------------------
  /// AI TESTED
  static List<String> addStringToListIfDoesNotContainIt({
    @required List<String> strings,
    @required String stringToAdd,
  }) {

    List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(strings) == true){
      _output = <String>[...strings];
    }

    if (stringToAdd != null){

      final bool _containsIt = checkStringsContainString(
        strings: _output,
        string: stringToAdd,
      );

      if (_containsIt == false) {
        _output.add(stringToAdd);
      }

    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<String> addStringsToStringsIfDoNotContainThem({
    @required List<String> listToTake,
    @required List<String> listToAdd,
  }){

    List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(listToTake) == true){
      _output = listToTake;
    }

    if (Mapper.checkCanLoopList(listToAdd) == true){

      for (final String string in listToAdd){

        _output = addStringToListIfDoesNotContainIt(
            strings: _output,
            stringToAdd: string
        );

      }

    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<String> addOrRemoveStringToStrings({
    @required List<String> strings,
    @required String string,
  }){

    final List<String> _output = <String>[...?strings];

    if (string != null){

      final bool _containsIt = checkStringsContainString(
          strings: _output,
          string: string,
      );

      if (_containsIt == true) {
        _output.removeWhere((element) => element == string);
      }

      else {
        _output.add(string);
      }


    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<String> removeStringsFromStrings({
    @required List<String> removeFrom,
    @required List<String> removeThis,
  }){

    final List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(removeFrom) == true){

      for (final String string in removeFrom){

        final bool _canRemove = checkStringsContainString(
            strings: removeThis,
            string: string
        );

        if (_canRemove == true){
          // blog('removeStringsFromStrings : removing : $string');
        }
        else {
          _output.add(string);
        }

      }

    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<String> putStringInStringsIfAbsent({
    @required List<String> strings,
    @required String string,
  }){
    final List<String> _output = <String>[...?strings];

    if (string != null) {
      final bool _contains = checkStringsContainString(
        strings: _output,
        string: string,
      );

      if (_contains == false) {
        _output.add(string);
      }
    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<String> cleanDuplicateStrings({
    @required List<String> strings,
  }) {
    final List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(strings) == true) {
      for (final String string in strings) {

        final bool _contains = checkStringsContainString(
          strings: _output,
          string: string,
        );

        if (_contains == false) {
          _output.add(string);
        }

      }
    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<String> cleanListNullItems(List<String> strings){
    final List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(strings) == true){

      for (final String string in strings){

        if (string != null && string != 'null'){
          _output.add(string);
        }

      }

    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static dynamic nullifyNullString(dynamic input){

    if (input == null){
      return null;
    }
    else if (input == 'null'){
      return null;
    }
    else if (input == ['null'] || input.toString() == '[null]'){
      return null;
    }
    else {
      return input;

    }

  }
  // -----------------------------------------------------------------------------

  /// SORTING STRINGS

  // --------------------
  /// AI TESTED
  static List<String> sortAlphabetically(List<String> inputList) {
    List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(inputList) == true) {
      inputList.sort((String a, String b){

        final String _a = a?.toLowerCase();
        final String _b = b?.toLowerCase();

        if (_a == null){
          return 1;
        }
        else if (_b == null){
          return -1;
        }
        else {
          return _a.compareTo(_b);
        }
      });

      _output = <String>[...inputList];

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// TRANSFORMERS

  // --------------------
  /// AI TESTED
  static List<String> getStringsFromDynamics({
    @required List<dynamic> dynamics,
  }) {
    final List<String> _strings = <String>[];

    if (Mapper.checkCanLoopList(dynamics) == true) {
      for (final dynamic thing in dynamics) {

        if (thing is String == true) {
          _strings.add(thing);
        }

        else if (thing is List){
          final List<String> _sub = getStringsFromDynamics(
            dynamics: thing,
          );
          _strings.addAll(_sub);
        }

        else {
          _strings.add(thing.toString());
        }

      }
    }

    return _strings;
  }
  // -----------------------------------------------------------------------------

  /// TRIGRAM

  // --------------------
  /// AI TESTED : WORKS PERFECT
  static List<String> createTrigram({
    @required String input,
    bool removeSpaces = false,
    int maxTrigramLength = 7,
  }){
    List<String> _trigram = <String>[];

    if (input != null){

      /// 0 - to lower cases
      final String _lowerCased = input.toLowerCase();

      /// 1 - first add each word separately
      final List<String> _splitWords = _lowerCased.trim().split(' ');
      _trigram.addAll(_splitWords);

      /// 2 - start trigramming after clearing spaces
      String _withoutSpaces = TextMod.removeSpacesFromAString(_lowerCased);
      if (removeSpaces == true){
        _withoutSpaces = TextMod.removeSpacesFromAString(_lowerCased);
      }
      else {
        _withoutSpaces = _lowerCased;
      }

      /// 3 - split characters into a list
      final List<String> _characters = _withoutSpaces.split('');
      final int _charactersLength = _characters.length;
      final int _maxTrigramLength = maxTrigramLength ?? _charactersLength;

      /// 4 - loop through trigram length 3 -> 4 -> 5 -> ... -> _charactersLength
      for (int trigramLength = 3; trigramLength <= _maxTrigramLength; trigramLength++){

        final int _difference = trigramLength - 1;

        /// 5 - loop in characters
        for (int i = 0; i < _charactersLength - _difference; i++){

          String _combined = '';

          /// 6 - combine
          for (int c = 0; c < trigramLength;c++){
            final String _char = _characters[i + c];
            _combined = '$_combined$_char';
          }

          /// 7 - add combination
          _trigram = Stringer.addStringToListIfDoesNotContainIt(strings : _trigram, stringToAdd : _combined,);
        }

      }

      // /// 3 - generate the triplets
      // for (int i = 0; i < _charactersLength - 2; i++){
      //   String _first = _characters[i];
      //   String _second = _characters[i+1];
      //   String _third = _characters[i+2];
      //   String _combined = '$_first$_second$_third';
      //   _trigram = TextMod.addStringToListIfDoesNotContainIt(strings : _trigram, stringToAdd : _combined,);
      // }

      // _trigramLength = 4;
      // /// 4 - generate quadruplets
      // for (int i = 0; i < _characters.length - 3; i++){
      //   String _first = _characters[i];
      //   String _second = _characters[i+1];
      //   String _third = _characters[i+2];
      //   String _fourth = _characters[i+3];
      //   String _combined = '$_first$_second$_third$_fourth';
      //   _trigram = TextMod.addStringToListIfDoesNotContainIt(strings : _trigram, stringToAdd : _combined,);
      // }

      // _trigramLength = 5;
      // /// 5 - generate Quintuplets
      // for (int i = 0; i < _characters.length - 4; i++){
      //   String _first = _characters[i];
      //   String _second = _characters[i+1];
      //   String _third = _characters[i+2];
      //   String _fourth = _characters[i+3];
      //   String _fifth = _characters[i+4];
      //   String _combined = '$_first$_second$_third$_fourth$_fifth';
      //   _trigram = TextMod.addStringToListIfDoesNotContainIt(strings : _trigram, stringToAdd : _combined,);
      // }

      // _trigramLength = 6;
      // /// 6 - generate Sextuplets
      // for (int i = 0; i < _characters.length - 5; i++){
      //   String _first = _characters[i];
      //   String _second = _characters[i+1];
      //   String _third = _characters[i+2];
      //   String _fourth = _characters[i+3];
      //   String _fifth = _characters[i+4];
      //   String _sixth = _characters[i+5];
      //   String _combined = '$_first$_second$_third$_fourth$_fifth$_sixth';
      //   _trigram = TextMod.addStringToListIfDoesNotContainIt(strings : _trigram, stringToAdd : _combined,);
      // }

    }

    return _trigram;
  }
  // -----------------------------------------------------------------------------

  /// GENERATORS

  // --------------------
  /// AI TESTED
  static String generateStringFromStrings({
    @required List<String> strings,
    String stringsSeparator = ', ',
  }){
    /// CREATES ONE STRING OF ALL STRINGS IN LIST AND SEPARATES THEM WITH ', '

    String _output = '';

    if (Mapper.checkCanLoopList(strings) == true){

      for (final String _string in strings){


        if (_output == ''){
          _output = _string;
        }

        else {
          _output = '$_output$stringsSeparator$_string';
        }

      }

    }

    if (_output == ''){
      _output = null;
    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// BLOGGING

  // --------------------
  /// MANUALLY TESTED : WORKS PERFECT
  static void blogStrings({
    @required List<String> strings,
    @required String invoker,
  }){
    _blog('blogStrings : START --- : $invoker');
    if (Mapper.checkCanLoopList(strings) == true){


      for (int i = 0; i <strings.length; i++){

        final String _index = Numeric.formatIndexDigits(
            index: i,
            listLength: strings.length
        );


        _blog('$_index : [ ${strings[i]} ]');

      }

    }
    else {
      _blog('blogStrings : strings can not be blogged');
    }

    _blog('blogStrings : END --- : $invoker');

  }
  // --------------------
  /// MANUALLY TESTED : WORKS PERFECT
  static List<String> blogStringsListsDifferences({
    @required List<String> strings1,
    @required List<String> strings2,
    String list1Name,
    String list2Name,
  }){
    _blog('blogStringsListsDifferences : START');

    /// ASSING LISTS NAMES
    final String _list1Name = list1Name ?? 'strings1';
    final String _list2Name = list2Name ?? 'strings2';

    /// SET UP LOGGING
    final List<String> _blogLog = <String>[];
    void blogAndAddToLog(String log){
      _blogLog.add(log);
      _blog(log);
    }

    /// 1 IS NULL
    if (strings1 == null){
      blogAndAddToLog('0 - $_list1Name is null');
    }

    /// 2 IS NULL
    if (strings2 == null){
      blogAndAddToLog('0 - $_list2Name is null');
    }

    if (strings1 != null && strings2 != null){

      /// 1 IS EMPTY
      if (strings1?.isEmpty == true){
        blogAndAddToLog('0 - $_list1Name is Empty');
      }

      /// 2 IS EMPTY
      if (strings2?.isNotEmpty == null){
        blogAndAddToLog('0 - $_list2Name is Empty');
      }

      /// DEEP CHECKS
      if (Mapper.checkCanLoopList(strings1) == true && Mapper.checkCanLoopList(strings2) == true){

        final bool _listsAreIdentical = Mapper.checkListsAreIdentical(
          list1: strings1,
          list2: strings2,
        );

        /// LISTS IDENTICAL
        if (_listsAreIdentical == true){
          blogAndAddToLog('A - Lists are PERFECTLY identical & has (${strings1.length}) string');
        }

        /// NOT IDENTICAL
        else {

          blogAndAddToLog('A - Lists are NOT identical');

          final bool _sortedAreIdentical = Mapper.checkListsAreIdentical(
            list1: Stringer.sortAlphabetically(strings1),
            list2: Stringer.sortAlphabetically(strings2),
          );

          /// LISTS JUST NEEDED SORTING
          if (_sortedAreIdentical == true){
            blogAndAddToLog('B - Lists just needed sorting to be identical, and each has (${strings1.length}) strings');
          }

          /// EVEN SORTED ARE NOT IDENTICAL
          else {

            blogAndAddToLog('B - SORTED Lists are NOT identical as well');

            List<String> _longer;
            List<String> _shorter;

            /// 1 > 2
            if (strings1.length > strings2.length){
              _longer = <String>[...strings1];
              _shorter = <String>[...strings2];
              blogAndAddToLog('C - [ $_list1Name.length (${strings1.length}) ] > [ $_list2Name.length (${strings2.length}) ] : '
                  '${_longer.length} - ${_shorter.length} = ${_longer.length - _shorter.length}');
            }

            /// 1 < 2
            else if (strings1.length < strings2.length){
              _longer = <String>[...strings2];
              _shorter = <String>[...strings1];
              blogAndAddToLog('C - [ $_list2Name.length (${strings2.length}) ] > [ $_list1Name.length (${strings1.length}) ] : '
                  '${_longer.length} - ${_shorter.length} = ${_longer.length - _shorter.length}');
            }

            /// 1 == 2
            else if (strings1.length == strings2.length){
              _longer = <String>[...strings2];
              _shorter = <String>[...strings1];
              blogAndAddToLog('C - strings lengths are identical & each has (${strings2.length}) strings');
            }

            /// WTF
            else {
              blogAndAddToLog('C - a77a : something is wrong here');
            }

            blogAndAddToLog('   ~~~~~~~~~   ');

            /// ITERATE TO SEE EACH ELEMENT
            for (int i = 0; i < _longer.length; i++){

              final String _string = _longer[i];

              final bool _shorterContains = checkStringsContainString(
                strings: _shorter,
                string: _string,
              );

              /// SHORTER LIST DO NOT HAVE THIS LIST
              if (_shorterContains == false){
                blogAndAddToLog('D - shorter List do not have : index ($i / ${_longer.length}) :-\n($_string)');
              }

              // else {
              //   blog('shorter has  : index : ( $i ) : string : ( $_string )');
              // }

            }


          }



        }


      }


    }


    _blog('blogStringsListsDifferences : END');

    return _blogLog;
  }
  // -----------------------------------------------------------------------------

  /// GETTERS

  // --------------------
  /// AI TESTED
  static List<String> getAddedStrings({
    @required List<String> oldStrings,
    @required List<String> newStrings,
  }){
    final List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(newStrings) == true){

      for (int i = 0; i < newStrings.length; i++){
        final String _string = newStrings[i];
        final bool _oldStringsContains = checkStringsContainString(
          strings: oldStrings,
          string: _string,
        );

        if (_oldStringsContains == false){
          _output.add(_string);
        }

      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<String> getRemovedStrings({
    @required List<String> oldStrings,
    @required List<String> newStrings,
  }){
    final List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(oldStrings) == true){

      for (int i = 0; i < oldStrings.length; i++){

        final String _string = oldStrings[i];

        final bool _newStringsContains = checkStringsContainString(
          strings: newStrings,
          string: _string,
        );

        if (_newStringsContains == false){
          _output.add(_string);
        }

      }

    }

      return _output;
  }
  // -----------------------------------------------------------------------------

  /// HASHTAGS

  // --------------------
  /// TESTED : WORKS PERFECT
  static List<String> findHashtags({
    @required String text,
    bool considerDash = true,
    bool removeHash = false,
  }){
    final List<String> _output = <String>[];

    if (text != null && text.isNotEmpty == true){

      String _rawExp;
      /// CONSIDER DASH
      if (considerDash == true){
        _rawExp = r'\B#[\w-]+';
      }
      /// IGNORE DASH
      else {
        _rawExp = r'\B#\w\w+';
      }

      final RegExp exp = RegExp(_rawExp);
      exp.allMatches(text).forEach((match){

        final String _match = match.group(0);

        /// REMOVE HASH
        if (removeHash == true){
          _output.add(TextMod.removeTextBeforeFirstSpecialCharacter(_match, '#'));
        }

        /// KEEP HASH
        else {
          _output.add(_match);
        }

      });

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static void _blog(dynamic msg){

    assert((){
      // ignore: avoid_print
      print(msg?.toString());
      return true;
    }(), '_');

  }
  // -----------------------------------------------------------------------------
}
