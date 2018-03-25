require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  def test_can_translate_one_lowercase_character
    translator = Translator.new
    expected_1 = ["0.", "..", ".0"]
    actual_1   = translator.english_to_braille("k")

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end

  def test_can_translate_a_different_lowercase_character
    translator = Translator.new
    expected   = ["00", "..", ".."]
    actual     = translator.english_to_braille("c")

    assert_equal expected, actual
  end

  def test_can_translate_multiple_lowercase_characters
    translator = Translator.new
    expected   = ["0.", "..", ".0", "0.", "..", ".."]
    actual     = translator.english_to_braille("ka")

    assert_equal expected, actual
  end

  def test_can_translate_one_uppercase_character
    translator = Translator.new
    expected   = ["..","..",".0","0.","..",".."]
    actual     = translator.english_to_braille("A")

    assert_equal expected, actual
  end

  def test_can_translate_multiple_uppercase_characters
    translator = Translator.new
    expected   = ["..", "..", ".0", "0.", "0.", "..", "..", "..", ".0", "0.", ".0", "00"]
    actual     = translator.english_to_braille("BZ")

    assert_equal expected, actual
  end

  def test_can_translate_multiple_upper_and_lowercase_characters
    translator = Translator.new
    expected   = ["..", "..", ".0", "0.", "..", "..", "0.", "0.", "..",
      "..", "..", ".0", "0.", "..", "..", "00", "..", ".."]
    actual     = translator.english_to_braille("AbCd")

    assert_equal expected, actual
  end

  def test_can_translate_spaces
    translator = Translator.new
    expected   = ["0.", ".0", "00", "..", "..", "..",
      "..", "..", ".0", "0.", "..", ".."]
    actual     = translator.english_to_braille("z O")

    assert_equal expected, actual
  end

  def test_can_translate_a_punctuation_mark
    translator = Translator.new
    expected   = ["..", "0.", "00"]
    actual     = translator.english_to_braille("?")

    assert_equal expected, actual
  end

  def test_can_translate_multiple_punctuation_marks
    translator = Translator.new
    expected   = ["..", "00", ".0", "..", "..", "00"]
    actual     = translator.english_to_braille(".-")

    assert_equal expected, actual
  end

  def test_can_translate_a_full_sentence
    translator = Translator.new
    # YOUR CODE HERE
  end
end
