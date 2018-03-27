require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer.rb'
require 'pry'

class PrinterTest < Minitest::Test
  def test_there_is_printer
    printer = Printer.new
    assert_instance_of Printer, printer
  end

  def test_can_print_one_character_first_line
    printer    = Printer.new
    translator = Translator.new
    character  = translator.english_to_braille("a")
    expected   = ["0."]
    actual     = printer.print_first_line(character)

    assert_equal expected, actual
  end

  def test_can_print_multiples_characters_first_line
    printer    = Printer.new
    translator = Translator.new
    character  = translator.english_to_braille("pizza")
    expected   = ["00", ".0", "0.", "0.", "0."]
    actual     = printer.print_first_line(character)

    assert_equal expected, actual
  end

  def test_can_print_multiples_characters_second_line
    printer    = Printer.new
    translator = Translator.new
    character  = translator.english_to_braille("pizza")
    expected   = ["0.", "0.", ".0", ".0", ".."]
    actual     = printer.print_second_line(character)

    assert_equal expected, actual
  end

  def test_can_print_multiples_characters_third_line
    printer    = Printer.new
    translator = Translator.new
    character  = translator.english_to_braille("pizza")
    expected   = ["0.", "..", "00", "00", ".."]
    actual     = printer.print_third_line(character)

    assert_equal expected, actual
  end
end
