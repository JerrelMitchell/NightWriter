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
    expected   =  "0."\
                  ".."\
                  ".."
    actual    = printer.print(character)
    assert_equal expected, actual
  end

  def test_can_print_multiple_characters
    printer    = Printer.new
    translator = Translator.new
    character  = translator.english_to_braille("pizza")

    expected  = '000.0..00...0..0000..0000.....'
    actual    = printer.print(character)
    assert_equal expected, actual
  end



end
