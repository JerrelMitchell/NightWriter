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

  def test_it_slices_single_character_from_translator_into_tracks
    printer = Printer.new
    translator = Translator.new

    text = translator.english_to_braille('a')
    actual = printer.print_tracks(text)
    expected = "0.
                ..
                ..
                  "
    assert_equal expected.delete(' '), actual
  end

  def test_it_slices_multiple_characters_from_translator_into_tracks
    printer = Printer.new
    translator = Translator.new

    text = translator.english_to_braille('abc')
    actual = printer.print_tracks(text)
    expected = "0.0.00
                ..0...
                ......
                      "
    assert_equal expected.delete(' '), actual
  end
end
