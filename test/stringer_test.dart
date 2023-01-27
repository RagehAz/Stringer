import 'package:flutter_test/flutter_test.dart';
import 'package:stringer/stringer.dart';

// write a flutter test group that includes several tests for following function
void main(){
  // -----------------------------------------------------------------------------

  /// checkStringsContainString

  // --------------------
  group('checkStringsContainString',(){

    test('Test that the function returns true when the input strings list contains the input string', () {
      const List<String> strings = ['hello', 'world', 'foo', 'bar'];
      const String string = 'foo';
      expect(Stringer.checkStringsContainString(strings: strings, string: string), equals(true));
    });

    test('Test that the function returns false when the input strings list does not contain the input string', () {
      const List<String> strings = ['hello', 'world', 'foo', 'bar'];
      const String string = 'baz';
      expect(Stringer.checkStringsContainString(strings: strings, string: string), equals(false));
    });

    test('Test that the function returns false when the input strings list is null', () {
      const List<String> strings = null;
      const String string = 'hello';
      expect(Stringer.checkStringsContainString(strings: strings, string: string), equals(false));
    });

    test('Test that the function returns false when the input string is null', () {
      const List<String> strings = ['hello', 'world', 'foo', 'bar'];
      const String string = null;
      expect(Stringer.checkStringsContainString(strings: strings, string: string), equals(false));
    });

    test('Test that the function returns false when both the input strings list and the input string are null', () {
      const List<String> strings = null;
      const String string = null;
      expect(Stringer.checkStringsContainString(strings: strings, string: string), equals(false));
    });

  });
  // -----------------------------------------------------------------------------

  /// addStringToListIfDoesNotContainIt

  // --------------------
  group('addStringToListIfDoesNotContainIt', () {

    test('Test that the function adds the input stringToAdd to the '
            'input strings list if it does not already contain it', () {
      const List<String> strings = ['hello', 'world', 'foo'];
      const String stringToAdd = 'bar';
      expect(Stringer.addStringToListIfDoesNotContainIt(
          strings: strings,
          stringToAdd: stringToAdd
      ),
          equals(['hello', 'world', 'foo', 'bar']));
    });

    test(
        'Test that the function does not add the input stringToAdd to the input strings list if it already contains it',
        () {
      const List<String> strings = ['hello', 'world', 'foo'];
      const String stringToAdd = 'foo';
      expect(Stringer.addStringToListIfDoesNotContainIt(strings: strings, stringToAdd: stringToAdd),
          equals(['hello', 'world', 'foo']));
    });

    test('Test that the function returns an empty list when '
        'the input strings list is null', () {
      const List<String> strings = null;
      const String stringToAdd = 'bar';
      expect(Stringer.addStringToListIfDoesNotContainIt(
          strings: strings,
          stringToAdd: stringToAdd),
          equals(['bar']));
    });

    test('Test that the function returns an empty list when '
        'the input stringToAdd is null', () {
      const List<String> strings = ['hello', 'world', 'foo'];
      const String stringToAdd = null;
      expect(Stringer.addStringToListIfDoesNotContainIt(strings: strings, stringToAdd: stringToAdd),
          equals(['hello', 'world', 'foo']));
    });

    test('Test that the function returns an empty list when '
        'both the input strings list and the input stringToAdd are null',
        () {
      const List<String> strings = null;
      const String stringToAdd = null;
      expect(Stringer.addStringToListIfDoesNotContainIt(strings: strings, stringToAdd: stringToAdd),
          equals([]));
    });

  });
  // -----------------------------------------------------------------------------

  /// addStringsToStringsIfDoNotContainThem

  // --------------------
  group('addStringsToStringsIfDoNotContainThem', () {

    test('should add strings to list if they do not contain them', () {
      final listToTake = ['a', 'b', 'c'];
      final listToAdd = ['d', 'e', 'f'];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: listToTake, listToAdd: listToAdd);

      expect(result, ['a', 'b', 'c', 'd', 'e', 'f']);
    });

    test('should not add strings that already exist in the list', () {
      final listToTake = ['a', 'b', 'c'];
      final listToAdd = ['b', 'c', 'd'];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: listToTake,
          listToAdd: listToAdd
      );

      expect(result, ['a', 'b', 'c', 'd']);
    });

    test('should return original list if listToAdd is empty', () {
      final listToTake = ['a', 'b', 'c'];
      final listToAdd = <String>[];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: listToTake,
          listToAdd: listToAdd
      );

      expect(result, ['a', 'b', 'c']);
    });

    test('should return empty list if both listToTake and listToAdd are empty', () {
      final listToTake = <String>[];
      final listToAdd = <String>[];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: listToTake,
          listToAdd: listToAdd
      );

      expect(result, <String>[]);
    });

    test('should return empty list if listToTake is null', () {
      final listToAdd = ['a', 'b', 'c'];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: null,
          listToAdd: listToAdd,
      );

      expect(result, <String>['a', 'b', 'c']);
    });

    test('should add strings to list if they do not contain them', () {
      final listToTake = ['a', 'b', 'c'];
      final listToAdd = ['d', 'e', 'f'];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: listToTake, listToAdd: listToAdd);

      expect(result, ['a', 'b', 'c', 'd', 'e', 'f']);
    });

    test('should return original list if listToAdd is empty', () {
      final listToTake = ['a', 'b', 'c'];
      final listToAdd = <String>[];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: listToTake,
          listToAdd: listToAdd
      );

      expect(result, ['a', 'b', 'c']);
    });

    test('should return empty list if both listToTake and listToAdd are empty', () {
      final listToTake = <String>[];
      final listToAdd = <String>[];

      final result = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: listToTake,
          listToAdd: listToAdd,
      );

      expect(result, <String>[]);
    });

    test('should return empty list if listToAdd is null', () {
      final listToTake = ['a', 'b', 'c'];

      final result =
          Stringer.addStringsToStringsIfDoNotContainThem(listToTake: listToTake, listToAdd: null);

      expect(result, ['a', 'b', 'c']);
    });

    test('should return listToTake if listToAdd is null and listToTake is null', () {
      final result =
          Stringer.addStringsToStringsIfDoNotContainThem(listToTake: null, listToAdd: null);

      expect(result, []);
    });

  });
  // -----------------------------------------------------------------------------

  /// addOrRemoveStringToStrings

  // --------------------
  group('addOrRemoveStringToStrings', () {

    test('adds a string when it is not present in the list', () {
      final strings = ['foo', 'bar'];
      const string = 'baz';
      final output = Stringer.addOrRemoveStringToStrings(strings: strings, string: string);
      expect(output, equals(['foo', 'bar', 'baz']));
    });

    test('removes a string when it is present in the list', () {
      final strings = ['foo', 'bar', 'baz'];
      const string = 'bar';
      final output = Stringer.addOrRemoveStringToStrings(strings: strings, string: string);
      expect(output, equals(['foo', 'baz']));
    });

    test('null input strings return empty list', () {
      const strings = null;
      const string = 'baz';
      final output = Stringer.addOrRemoveStringToStrings(strings: strings, string: string);
      expect(output, equals(['baz']));
    });

    test('null input string return original list', () {
      final strings = ['foo', 'bar'];
      const string = null;
      final output = Stringer.addOrRemoveStringToStrings(
          strings: strings,
          string: string,
      );
      expect(output, equals(strings));
    });

    test('adds an empty string', () {
      final strings = ['foo', 'bar'];
      const string = '';
      final output = Stringer.addOrRemoveStringToStrings(strings: strings, string: string);
      expect(output, equals(['foo', 'bar', '']));
    });

    test('removes an empty string', () {
      final strings = ['foo', 'bar', ''];
      const string = '';
      final output = Stringer.addOrRemoveStringToStrings(strings: strings, string: string);
      expect(output, equals(['foo', 'bar']));
    });

    test('handles whitespace strings', () {
      final strings = ['foo', 'bar'];
      const string = ' ';
      final output = Stringer.addOrRemoveStringToStrings(strings: strings, string: string);
      expect(output, equals(['foo', 'bar', ' ']));
    });

    test('handles leading and trailing whitespaces', () {
      final strings = ['foo', 'bar'];
      const string = '   baz   ';
      final output = Stringer.addOrRemoveStringToStrings(strings: strings, string: string);
      expect(output, equals(['foo', 'bar', '   baz   ']));
    });

    test('handles multiple occurrences of the same string', () {
      final strings = ['foo', 'bar', 'baz', 'baz'];
      const string = 'baz';

      final output = Stringer.addOrRemoveStringToStrings(
          strings: strings,
          string: string
      );

      expect(output, equals(['foo', 'bar']));
    });

  });
  // -----------------------------------------------------------------------------

  /// removeStringsFromStrings

  // --------------------
  group('removeStringsFromStrings tests', () {

    test('removes strings from list', () {
      final List<String> removeFrom = ['a', 'b', 'c', 'd'];
      final List<String> removeThis = ['a', 'c'];
      final List<String> expectedOutput = ['b', 'd'];

      expect(Stringer.removeStringsFromStrings(
          removeFrom: removeFrom,
          removeThis: removeThis),
          expectedOutput);

    });

    test('does not remove any strings when list is empty', () {
      final List<String> removeFrom = [];
      final List<String> removeThis = ['a', 'c'];
      final List<String> expectedOutput = [];

      expect(Stringer.removeStringsFromStrings(removeFrom: removeFrom, removeThis: removeThis),
          expectedOutput);
    });

    test('does not remove any strings when removeThis list is empty', () {
      final List<String> removeFrom = ['a', 'b', 'c', 'd'];
      final List<String> removeThis = [];
      final List<String> expectedOutput = ['a', 'b', 'c', 'd'];

      expect(Stringer.removeStringsFromStrings(removeFrom: removeFrom, removeThis: removeThis),
          expectedOutput);
    });

    test('throws error when removeFrom list is null', () {
      const List<String> removeFrom = null;
      final List<String> removeThis = ['a', 'c'];

      expect(Stringer.removeStringsFromStrings(
              removeFrom: removeFrom,
              removeThis: removeThis),
          []);
    });

    test('throws error when removeThis list is null', () {

      final List<String> removeFrom = ['a', 'b', 'c', 'd'];
      const List<String> removeThis = null;

      expect(Stringer.removeStringsFromStrings(
          removeFrom: removeFrom,
          removeThis: removeThis),
          ['a', 'b', 'c', 'd']);
    });

  });
  // -----------------------------------------------------------------------------

  /// putStringInStringsIfAbsent

  // --------------------
  group('putStringInStringsIfAbsent tests', () {

    test('a', () {
      final List<String> strings = ['a', 'b', 'c'];
      const String string = 'd';
      final List<String> expectedOutput = ['a', 'b', 'c', 'd'];

      expect(Stringer.putStringInStringsIfAbsent(strings: strings, string: string), expectedOutput);
    });

    test('b', () {
      final List<String> strings = ['a', 'b', 'c'];
      const String string = 'c';
      final List<String> expectedOutput = ['a', 'b', 'c'];

      expect(Stringer.putStringInStringsIfAbsent(strings: strings, string: string), expectedOutput);
    });

    test('c', () {
      final List<String> strings = [];
      const String string = 'c';
      final List<String> expectedOutput = ['c'];

      expect(Stringer.putStringInStringsIfAbsent(
          strings: strings,
          string: string),
          expectedOutput);
    });

    test('d', () {
      const List<String> strings = null;
      const String string = 'c';

      expect(Stringer.putStringInStringsIfAbsent(
          strings: strings,
          string: string),
          ['c']);
    });

    test('e', () {
      final List<String> strings = ['a', 'b', 'c'];
      const String string = null;

      expect(Stringer.putStringInStringsIfAbsent(
          strings: strings,
          string: string),
          ['a', 'b', 'c']);
    });

  });
  // -----------------------------------------------------------------------------

  /// cleanDuplicateStrings

  // --------------------
  group('cleanDuplicateStrings tests', () {

    test('removes duplicate strings from list', () {
      final List<String> strings = ['a', 'b', 'c', 'a', 'b'];
      final List<String> expectedOutput = ['a', 'b', 'c'];

      expect(Stringer.cleanDuplicateStrings(strings: strings), expectedOutput);
    });

    test('returns same list when no duplicates', () {
      final List<String> strings = ['a', 'b', 'c'];
      final List<String> expectedOutput = ['a', 'b', 'c'];

      expect(Stringer.cleanDuplicateStrings(strings: strings), expectedOutput);
    });

    test('returns empty list when input is empty', () {
      final List<String> strings = [];
      final List<String> expectedOutput = [];
      expect(Stringer.cleanDuplicateStrings(strings: strings), expectedOutput);
    });

    test('throws error when strings list is null', () {
      const List<String> strings = null;
      expect(Stringer.cleanDuplicateStrings(strings: strings), []);
    });

  });
  // -----------------------------------------------------------------------------

  /// cleanListNullItems

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// nullifyNullString

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// sortAlphabetically2

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// getStringsFromDynamics

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// createTrigram

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// generateStringFromStrings

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// getAddedStrings

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// getRemovedStrings

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// findHashtags

  // --------------------
  ///
  // -----------------------------------------------------------------------------

  /// STRINGS ADDED AND REMOVED

  // --------------------
  const List<String> _oldList =        <String>['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
  const List<String> _newWithAdded =   <String>['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
  const List<String> _newWithRemoved = <String>['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i'];
  // --------------------
  test('getAddedStrings', () {

    final List<String> _added = Stringer.getAddedStrings(
      oldStrings: _oldList,
      newStrings: _newWithAdded,
    );
    expect(_added, ['k']);


  });
  // --------------------
  test('getRemovedStrings', () {

    final List<String> _removed = Stringer.getRemovedStrings(
      oldStrings: _oldList,
      newStrings: _newWithRemoved,
    );
    expect(_removed, ['j']);

    final List<String> _removed2 = Stringer.getRemovedStrings(
      oldStrings: [],
      newStrings: _newWithRemoved,
    );
    expect(_removed2, []);

    final List<String> _removed3 = Stringer.getRemovedStrings(
      oldStrings: null,
      newStrings: _newWithRemoved,
    );
    expect(_removed3, []);


    final List<String> _removed4 = Stringer.getRemovedStrings(
      oldStrings: [null],
      newStrings: _newWithRemoved,
    );
    expect(_removed4, [null]); // indeed it should remove the null


  });
  // -----------------------------------------------------------------------------
  test('removeStringsFromStrings', () async {

    const List<String> _source = <String>['wa7ed', 'etneen', 'talata', 'arba3a'];

    const List<String> _toRemove = <String>['wa7ed', 'etneen'];

    final List<String> _modified = Stringer.removeStringsFromStrings(
        removeFrom: _source,
        removeThis: _toRemove,
    );

    expect(_modified, <String>['talata', 'arba3a']);
  });
  // -----------------------------------------------------------------------------
}
