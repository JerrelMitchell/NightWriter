require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  def test_can_translate_one_lowercase_character
    translator = Translator.new
    expected   = ['0.', '..', '0.']
    actual     = translator.english_to_braille('k')
    assert_equal expected, actual
  end

  def test_can_translate_a_different_lowercase_character
    translator = Translator.new
    expected   = ['00', '..', '..']
    actual     = translator.english_to_braille('c')
    assert_equal expected, actual
  end

  def test_can_translate_multiple_lowercase_characters
    translator = Translator.new
    expected   = ['.0', '0.', '0.', '0.', '0.', '0.',\
                  '.0', '0.', '..', '00', '0.', '0.']
    actual     = translator.english_to_braille('slip')
    assert_equal expected, actual
  end

  def test_can_translate_spaces
    translator = Translator.new
    expected   = ['0.', '.0', '00',\
                  '..', '..', '..',\
                  '0.', '.0', '0.']
    actual     = translator.english_to_braille('z o')
    assert_equal expected, actual
  end

  def test_can_translate_a_punctuation_mark
    translator = Translator.new
    expected   = ['..', '0.', '00']
    actual     = translator.english_to_braille('?')
    assert_equal expected, actual
  end

  def test_can_translate_multiple_punctuation_marks
    translator = Translator.new
    expected   = ['..', '00', '.0',\
                  '..', '..', '00',\
                  '..', '00', '0.']
    actual     = translator.english_to_braille('.-!')
    assert_equal expected, actual
  end

  def test_can_translate_one_uppercase_character
    translator = Translator.new
    expected   = ['..', '..', '.0', '0.', '..', '..']
    actual     = translator.english_to_braille('A')
    assert_equal expected, actual
  end

  def test_can_translate_multiple_uppercase_characters
    translator = Translator.new
    expected   = ['..', '..', '.0', '.0', '00', '.0',\
                  '..', '..', '.0', '0.', '.0', '0.',\
                  '..', '..', '.0', '.0', '00', '.0']
    actual     = translator.english_to_braille('WOW')
    assert_equal expected, actual
  end

  def test_can_translate_multiple_upper_and_lowercase_characters
    translator = Translator.new
    expected   = ['..', '..', '.0', '0.', '..', '..',\
                  '0.', '0.', '..', '..', '..', '.0',\
                  '00', '..', '..', '00', '.0', '..']
    actual     = translator.english_to_braille('AbCd')
    assert_equal expected, actual
  end

  def test_can_translate_a_number
    translator = Translator.new
    expected   = ['.0', '.0', '00', '0.', '.0', '..']
    actual     = translator.english_to_braille('5')
    assert_equal expected, actual
  end

  def test_can_translate_multiple_numbers
    translator = Translator.new
    expected   = ['.0', '.0', '00', '0.', '0.', '..',\
                  '.0', '.0', '00', '.0', '0.', '..',\
                  '.0', '.0', '00', '00', '00', '..',\
                  '.0', '.0', '00', '00', '.0', '..']
    actual     = translator.english_to_braille('2974')
    assert_equal expected, actual
  end

  def test_can_translate_a_lowercase_sentence
    translator = Translator.new
    expected   = ['..', '..', '.0', '00', '..', '0.',\
                  '.0', '0.', '..', '0.', '..', '0.',\
                  '0.', '.0', '..', '..', '..', '0.',\
                  '.0', '0.', '0.', '..', '..', '..',\
                  '.0', '.0', '00', '00', '0.', '..',\
                  '.0', '.0', '00', '0.', '0.', '..',\
                  '00', '.0', '0.', '00', '.0', '..',\
                  '..', '..', '..', '..', '..', '.0',\
                  '00', '0.', '0.', '..', '..', '.0',\
                  '.0', '0.', '..', '..', '..', '.0',\
                  '0.', '.0', '00', '..', '..', '.0',\
                  '0.', '.0', '00', '..', '..', '.0',\
                  '0.', '..', '..', '..', '0.', '00', '..', '00', '0.']
    actual     = translator.english_to_braille("Mike's 62nd PIZZA?!")
    assert_equal expected, actual
  end

  def test_it_can_translate_one_character_from_braille_to_english
    translator = Translator.new
    actual     = translator.braille_to_english('0.....')
    assert_equal 'a', actual
  end

  def test_it_can_translate_multiple_characters_from_braille_to_english
    translator = Translator.new
    braille    = '0.....0.....0.....'
    actual     = translator.braille_to_english(braille)
    assert_equal 'aaa', actual
  end

  def test_can_translate_a_word_from_braille_to_english
    translator = Translator.new
    braille    = '.000.00..0..0......0000.0.00..0..0..0.000.'
    expected   = 'weather'
    actual     = translator.braille_to_english(braille)
    assert_equal expected, actual
  end

  def test_can_translate_a_space_from_braille_to_english
    translator = Translator.new
    braille    = '......'
    expected   = ' '
    actual     = translator.braille_to_english(braille)
    assert_equal expected, actual
  end

  def test_can_translate_multiple_punctuation_marksfrom_braille_to_english
    translator = Translator.new
    braille    = '....0...0.00..000.....0.'
    expected   = "'?!'"
    actual     = translator.braille_to_english(braille)
    assert_equal expected, actual
  end

  def test_it_can_translate_a_sentence_from_braille_to_english

    translator = Translator.new
    braille    = '0.00..0..0..0.0.0.0.0.0.0..00........0000.'\
                 '0.00..0..0..0.000.0..0....0.........0.00..'\
                 '0..00..000.0......0.....0.000.0..0........'\
                 '00.0000..00.0...00..0.00'
    expected   = "hello there, how are you?"
    actual     = translator.braille_to_english(braille)
    assert_equal expected, actual
  end

  def test_it_can_translate_a_capital_from_braille_to_english
    
    translator = Translator.new
    braille    = '.....00..000'
    expected   = "Z"
    actual     = translator.braille_to_english(braille)
    assert_equal expected, actual
  end

  def test_it_can_translate_capital_letters_within_a_word_from_braille_to_english
    skip
    translator = Translator.new
    braille    = '.....0000.0..00........00..0000..000.....00.....'
    expected   = "PiZzA"
    actual     = translator.braille_to_english(braille)
    assert_equal expected, actual
  end

  def test_it_can_translate_a_number_from_braille_to_english
    skip
    translator = Translator.new
    braille    = '.0.000000...'
    expected   = "6"
    actual     = translator.braille_to_english(braille)
    assert_equal expected, actual
  end


end
