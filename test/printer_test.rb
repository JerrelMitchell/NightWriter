require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer.rb'
require './lib/translator'
require 'pry'

class PrinterTest < Minitest::Test
  def test_it_exists
    printer = Printer.new
    assert_instance_of Printer, printer
  end

  def test_it_is_created_with_empty_tracks
    printer = Printer.new
    assert printer.track1.empty?
    assert printer.track2.empty?
    assert printer.track3.empty?
  end

  def test_it_is_created_with_empty_output
    printer = Printer.new
    assert printer.output_text.empty?
  end

  def test_it_fills_tracks_with_translated_braille
    printer    = Printer.new
    translator = Translator.new
    text       = translator.english_to_braille('z')

    printer.fill_tracks(text)

    actual1   = printer.track1
    expected1 = '0.'
    assert_equal expected1, actual1

    printer.fill_tracks(text)

    actual2   = printer.track2
    expected2 = '.0.0'
    assert_equal expected2, actual2

    printer.fill_tracks(text)

    actual3   = printer.track3
    expected3 = '000000'
    assert_equal expected3, actual3
  end

  def test_it_empties_tracks_to_output_text_string
    printer    = Printer.new
    translator = Translator.new
    text       = translator.english_to_braille('caz')

    printer.fill_tracks(text)
    printer.fill_tracks(text)
    printer.fill_tracks(text)

    printer.empty_tracks_into_output(printer.track1)

    actual   = printer.output_text
    expected = %(000000\n......\n......\n)
    assert_equal expected, actual
  end

  def test_it_slices_single_character_from_translator_into_tracks
    printer    = Printer.new
    translator = Translator.new
    text       = translator.english_to_braille('a')
    actual     = printer.print_tracks(text)
    expected   = %(0.\n..\n..\n)
    assert_equal expected, actual
  end

  def test_it_slices_multiple_characters_from_translator_into_tracks
    printer    = Printer.new
    translator = Translator.new
    text       = translator.english_to_braille('abc')
    actual     = printer.print_tracks(text)
    expected   = %(0.0.00\n..0...\n......\n)
    assert_equal expected, actual
  end
end
