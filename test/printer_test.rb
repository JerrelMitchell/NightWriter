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

  def test_it_fills_tracks
    printer    = Printer.new
    translator = Translator.new
    text1 = translator.english_to_braille('x')
    printer.fill_tracks(text1)

    actual1   = printer.track1
    expected1 = '00'
    assert_equal expected1, actual1

    actual2 = printer.track2
    expected2 = '..'
    assert_equal expected2, actual2

    actual3   = printer.track2
    expected3 = '..'
    assert_equal expected3, actual3
  end

  def test_it_ends_tracks
    printer = Printer.new
    translator = Translator.new
    track1 = translator.english_to_braille('a')

    5.times do
      printer.fill_tracks(track1)
    end

    printer.track1.chomp

    refute printer.track1.length == 5

    75.times do
      printer.fill_tracks(track1)
    end

    printer.track.chomp
    assert printer.track1.chomp == printer.track1
  end

  def test_it_slices_single_character_from_translator_into_tracks
    printer = Printer.new
    translator = Translator.new

    text = translator.english_to_braille('a')
    actual = printer.print_tracks(text)
    expected = %(0.\n..\n..\n)
    assert_equal expected, actual
  end

  def test_it_slices_multiple_characters_from_translator_into_tracks
    printer = Printer.new
    translator = Translator.new

    text = translator.english_to_braille('abc')
    actual = printer.print_tracks(text)
    expected = %(0.0.00\n..0...\n......\n)
    assert_equal expected, actual
  end
end
