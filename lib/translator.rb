# handles manipulation of alphanumeric characters into/from braille.
class Translator
  attr_reader :alphabet
  def initialize
    @alphabet ={ "a" => ["0." ,"..", ".."],
                 "b" => ["0.", "0.", ".."],
                 "c" => ["00", "..", ".."],
                 "d" => ["00", ".0", ".."],
                 "e" => ["0.", ".0", ".."],
                 "f" => ["00", "0.", ".."],
                 "g" => ["00", "00", ".."],
                 "h" => ["0.", "00", ".."],
                 "i" => [".0", "0.", ".."],
                 "j" => [".0", "00", ".."],
                 "k" => ["0.", "..", "0."],
                 "l" => ["0.", "0.", "0."],
                 "m" => ["00", "..", "0."],
                 "n" => ["00", ".0", "0."],
                 "o" => ["0.", ".0", "0."],
                 "p" => ["00", "0.", "0."],
                 "q" => ["00", "00", "0."],
                 "r" => ["0.", "00", "0."],
                 "s" => [".0", "0.", "0."],
                 "t" => [".0", "00", "0."],
                 "u" => ["0.", "..", "00"],
                 "v" => ["0.", "0.", "00"],
                 "w" => [".0", "00", ".0"],
                 "x" => ["00", "..", "00"],
                 "y" => ["00", ".0", "00"],
                 "z" => ["0.", ".0", "00"],
                 "1" => ["0.", "..", ".."],
                 "2" => ["0.", "0.", ".."],
                 "3" => ["00", "..", ".."],
                 "4" => ["00", ".0", ".."],
                 "5" => ["0.", ".0", ".."],
                 "6" => ["00", "0.", ".."],
                 "7" => ["00", "00", ".."],
                 "8" => ["0.", "00", ".."],
                 "9" => [".0", "0.", ".."],
                 "0" => [".0", "00", ".."],
                 " " => ["..", "..", ".."],
                 "^" => ["..", "..", ".0"],
                 "#" => [".0", ".0", "00"],
                 "-" => ["..", "..", "00"],
                 "." => ["..", "00", ".0"],
                 "?" => ["..", "0.", "00"],
                 "!" => ["..", "00", "0."],
                 "'" => ["..", "..", "0."],
                 "," => ["..", "0.", ".."],
                 letter_shift: ["..", "..", ".0"],
                 number_shift: [".0", ".0", "00"] }
  end

  # initial attempt to find duplicates for incoming iterated characters
  def find_duplicates(characters)
    encountered = {}
    characters.each do |character|
      if encountered[character]
        puts "Dupe exists for: " << character
      else
        encountered[character] = 1
      end
    end
  end

  # method needs to add ONE shift if there are multiple numbers put together,
  # and TWO shifts if there is a word made of capitals letters.

  # method needs to be broken up and encapsulated
  def english_to_braille(chars)
    chars.split('').map do |character|
      if character.count('0-9') > 0
        alphabet.fetch_values(:number_shift, character)
      elsif character == character.downcase
        alphabet[character]
      else
        alphabet.fetch_values(:letter_shift, character.downcase)
      end
    end.flatten
  end
end
